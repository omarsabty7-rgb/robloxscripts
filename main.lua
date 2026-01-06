local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- // إنشاء الواجهة الأساسية
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local Container = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "SimpleRedHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- إعدادات الألوان
local Red = Color3.fromRGB(220, 40, 40)
local Black = Color3.fromRGB(20, 20, 20)
local Gray = Color3.fromRGB(35, 35, 35)

-- القائمة الرئيسية
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Black
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -180)
MainFrame.Size = UDim2.new(0, 260, 0, 380)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

-- إطار خارجي رمادي بسيط
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(50, 50, 50)
Stroke.Thickness = 1.2

-- العنوان
Title.Parent = MainFrame
Title.Text = "  RED HUB V7"
Title.Size = UDim2.new(0.8, 0, 0, 45)
Title.TextColor3 = Red
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- زر الإغلاق X (أعلى اليمين)
CloseBtn.Parent = MainFrame
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
CloseBtn.Size = UDim2.new(0, 45, 0, 45)
CloseBtn.Position = UDim2.new(1, -45, 0, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BackgroundTransparency = 1
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- حاوية الأزرار
Container.Parent = MainFrame
Container.Position = UDim2.new(0.05, 0, 0.15, 0)
Container.Size = UDim2.new(0.9, 0, 0.8, 0)
Container.BackgroundTransparency = 1

UIListLayout.Parent = Container
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- وظيفة صنع الأقسام الموحدة (Speed, Jump, Fly, Aim)
local function CreateSetting(name, default, callback)
    local state = false
    local Frame = Instance.new("Frame", Container)
    Frame.Size = UDim2.new(1, 0, 0, 40)
    Frame.BackgroundColor3 = Gray
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 5)

    local Label = Instance.new("TextLabel", Frame)
    Label.Text = " " .. name
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.TextColor3 = Color3.new(1,1,1)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 12
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Input = Instance.new("TextBox", Frame)
    Input.Text = tostring(default)
    Input.Size = UDim2.new(0, 40, 0, 25)
    Input.Position = UDim2.new(0.55, 0, 0.2, 0)
    Input.BackgroundColor3 = Black
    Input.TextColor3 = Red
    Input.Font = Enum.Font.Code
    Instance.new("UICorner", Input)

    local Toggle = Instance.new("TextButton", Frame)
    Toggle.Text = "OFF"
    Toggle.Size = UDim2.new(0, 45, 0, 25)
    Toggle.Position = UDim2.new(0.8, 0, 0.2, 0)
    Toggle.BackgroundColor3 = Black
    Toggle.TextColor3 = Color3.fromRGB(100,100,100)
    Toggle.Font = Enum.Font.GothamBold
    Toggle.TextSize = 10
    Instance.new("UICorner", Toggle)

    Toggle.MouseButton1Click:Connect(function()
        state = not state
        Toggle.Text = state and "ON" or "OFF"
        Toggle.BackgroundColor3 = state and Red or Black
        Toggle.TextColor3 = state and Black or Color3.fromRGB(100,100,100)
        callback("toggle", state)
    end)

    Input.FocusLost:Connect(function() callback("value", tonumber(Input.Text)) end)
end

-- إضافة الخصائص
CreateSetting("WALK SPEED", 100, function(t, v) end)
CreateSetting("JUMP POWER", 100, function(t, v) end)
CreateSetting("FLY SPEED", 50, function(t, v) end)
CreateSetting("AIMBOT", 0.2, function(t, v) end)

-- زر ديسكورد (بسيط)
local Disc = Instance.new("TextButton", Container)
Disc.Text = "COPY DISCORD LINK"
Disc.Size = UDim2.new(1, 0, 0, 35)
Disc.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
Disc.TextColor3 = Color3.new(1,1,1)
Disc.Font = Enum.Font.GothamBold
Instance.new("UICorner", Disc)
Disc.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yz5yADqe")
end)
