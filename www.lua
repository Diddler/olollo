local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("CHEIR HUB", "BloodTheme")

local Tab = Window:NewTab("Home") 
local Section = Tab:NewSection("VERSION: V1.5.1")
local Section = Tab:NewSection("Thanks for using.")
local Section = Tab:NewSection("Click the tabs on the left for feautres!")






local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main Features")
Section:NewButton("Infinite Yield FE Admin", "Infinite Yeild", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
Section:NewButton("Anti-Afk", "Antiafk", function()
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)
Section:NewButton("Remove all Barriers", "Removes doors", function()
    game.workspace.RankBarriers:Destroy()
end)
Section:NewButton("Disable blur (BUGGY AF)", "Anti BLur", function()
    game:GetService("Lighting").Blur:Destroy() --Idk what to remove
    game:GetService("Lighting").Stage5:Destroy()
    game:GetService("Lighting").Stage4:Destroy()
    game:GetService("Lighting").Running:Destroy()
    game:GetService("Lighting").PanicBlur:Destroy()
end)
Section:NewButton("Instant canibal (must be night)", "makes u homo", function()
local A_1 = "UpdateInsanityValue"
local A_2 = 4
local A_3 = "013069"
local Event = game:GetService("ReplicatedStorage").Events.Aswang
Event:FireServer(A_1, A_2, A_3)

end)


local Tab = Window:NewTab("Teleports")
local Section = Tab:NewSection("Teleports")
Section:NewButton("TP to Sanatorium", "Tp to the Sanatorium", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4225.70947, 406.243774, 999.391235)
end)
Section:NewButton("TP to Lockers", "Tp to the Clothing", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4157.451, 403.449, 1008.901)
end)
Section:NewButton("TP to Lecture Hall", "Tp to the Lecture Hall", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4459.56982, 441.105011, 1060.22998, -0.984812617, 0, 0.173621148, 0, 1, 0, -0.173621148, 0, -0.984812617)
end)
Section:NewButton("TP to Staff Room", "Tp to the Staff Room", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4042.63599, 439.103821, 1193.30298, 0.984812498, -0, -0.173621148, 0, 1, -0, 0.173621148, 0, 0.984812498)
end)
Section:NewButton("TP to Kitchen", "Tp to the Kitchen", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4088.37427, 444.693665, 1046.80273, 0.173398912, -0.000540713198, 0.984851718, 0.00342645217, 0.999994099, -5.42555936e-05, -0.984845877, 0.00338395452, 0.173399746)
end)
Section:NewButton("TP to Secret place", "Tp to the Secret Dev place", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3817.24097, 70.3669052, 148.974365, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)
local Section = Tab:NewSection("More coming soon, DM if you have a place.")



local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Humanoid LocalPlayer")
Section:NewSlider("JumpPower Changer", "jp changfer", 500, 0, function(s) -- 500 (MaxValue) | 65 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
Section:NewSlider("Walkspeed Changer", "ws changfer", 500, 0, function(s) -- 500 (MaxValue) | 17 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)









local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("cheirmen#5015 -- UI & Scripting")
local Section = Tab:NewSection("xHeptc#2255 -- Emotional help & Scripting help")
local Section = Tab:NewSection("xaxa#0008 -- Death wish Help")
local Section = Tab:NewSection("wYn#0001 -- Mental Help")
