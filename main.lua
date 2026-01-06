local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Elite Hub V1", "DarkScene")

local Tab1 = Window:NewTab("Player")
local Section1 = Tab1:NewSection("Character Mods")

Section1:NewButton("Super Speed", "Set WalkSpeed to 100", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

Section1:NewButton("High Jump", "Set JumpPower to 100", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)

Section1:NewButton("Reset Stats", "Reset Speed and Jump", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

local Tab2 = Window:NewTab("Visuals")
local Section2 = Tab2:NewSection("ESP")

Section2:NewButton("Enable ESP", "See players through walls", function()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer and player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        end
    end
end)

local Tab3 = Window:NewTab("Farming")
local Section3 = Tab3:NewSection("Auto Clicker")

Section3:NewToggle("Auto Clicker", "Toggle Auto Click", function(state)
    _G.AutoClick = state
    while _G.AutoClick do
        local vu = game:GetService("VirtualUser")
        vu:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(0.1)
    end
end)

local Tab4 = Window:NewTab("Credits")
local Section4 = Tab4:NewSection("Discord: [Your Server Link]")
Section4:NewLabel("Scripting by Elite Hub")
