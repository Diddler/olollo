if debounce then return end
getgenv().debounce = true


local modules
local gc = getgc(true)
for i = 1, #gc do
    local v = gc[i]
    if type(v) == "table" and rawget(v, "Network") then
        modules = v
        break
    end
end


local next = next
local warn = warn
local print = print
local foreach = table.foreach

local network = modules.Network
local regionData = modules.DataManager.RegionData
local networkBinds = getupvalue(network.UnbindEvent, 1)
local oldStart = networkBinds.StartBattle
local oldRelay = networkBinds.RelayBattle

local plrName = game:GetService("Players").LocalPlayer.Name
local running, healOverride, attacking


local function spawn(found)
    if found or healOverride then
        healOverride = false
        network:post("PlayerData", "Heal")
    end
    if regionData.Encounters then
        network:post("RequestWild", regionData.ChunkName or regionData.Reference, (next(regionData.Encounters)))
    end
end

modules.Battle:WildBattle(nil, next(regionData.Encounters)):Wait()
network:BindEvent("RelayBattle", function(actions, battleData)
if attacking then
        for i, v in next, actions do
            if v.Action == "Dialogue" then
                local text = v.Text
                if text:match("What will .+ do?") then
                    local ally = battleData.Out1[1]
                    network:post("BattleAction", {
                        {
                            ActionType = "Attack",
                            Action = ally.Moves[1].Name,
                            Target = battleData.Out2[1].ID,
                            User = ally.ID
                        }
                    })
                    network:post(plrName .. "Ready")
                end
            elseif v.Action == "Transition" then
                attacking = false
                network:post(plrName .. "Over")
                spawn()
            end
        end
        return
    end
    elseif running then
        for i, v in next, actions do
            if v.Action == "Dialogue" then
                local text = v.Text
                if text:match("ran away successfully") then
                    running = false
                    network:post(plrName .. "Over")
                    spawn()
                elseif text:match("failed to run away") then
                    healOverride = true
                    network:post("BattleAction", {
                        {
                            Target = "RunAway",
                            ActionType = "Run",
                            User = battleData.Out1[1].ID,
                        }
                    })
                end
            end
        end
        return
    end
    for i, v in next, actions do
        if v.Action == "Transition" then
            oldRelay(actions, battleData)
            spawn(true)
            return
        end
    end
    return oldRelay(actions, battleData)
end)
network:BindEvent("StartBattle", function(battleData)
    local doodle = battleData.Out2[1]
    local doodleName = doodle.Name
    local equips = doodle.Equip

    local isShiny = misprints and doodle.Shiny
    local isTinted = tints and doodle.Tint ~= 0
    local hasSkin = skins and doodle.Skin ~= 0
    local hasNameColor = nameColor and doodle.NameColor ~= 1
    local hasEquip = equips and next(equips) and not holderBlacklist[doodleName]
    
    if whitelist[doodleName] or isShiny or isTinted or hasSkin or hasNameColor or hasEquip then
        oldStart(battleData)
        warn("FOUND:")
        warn(doodleName, doodle.Star, doodle.Ability == doodle.Info.HiddenAbility, "Equips:")
        foreach(equips, print)
	print("Killing " .. doodleName)
        attacking = true
        network:post(plrName .. "InitialReady")
    else
        print("Ran from " .. doodleName)
        running = true
        network:post(plrName .. "InitialReady")
        network:post("BattleAction", {
            {
                ActionType = "Run",
                Target = "RunAway",
                User = battleData.Out1[1].ID,
            }
        })
    end
end)

spawn(true)
