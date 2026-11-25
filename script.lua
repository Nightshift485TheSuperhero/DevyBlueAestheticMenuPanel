local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local parentGui = CoreGui or player:WaitForChild("PlayerGui")

-- Ta bort tidigare instanser för att förhindra dubbletter
if parentGui:FindFirstChild("MMV_FinalLuxuryMenuSystem") then
    parentGui["MMV_FinalLuxuryMenuSystem"]:Destroy()
end

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "MMV_FinalLuxuryMenuSystem"
MainGui.ResetOnSpawn = false
MainGui.Parent = parentGui

-- ==========================================
-- 1. PASSWORD SECURITY SYSTEM (CYAN THEME)
-- ==========================================
local PassFrame = Instance.new("Frame")
local PassCorner = Instance.new("UICorner")
local PassStroke = Instance.new("UIStroke")
local PassTitle = Instance.new("TextLabel")
local PassInput = Instance.new("TextBox")
local PassBtn = Instance.new("TextButton")
local PassBtnCorner = Instance.new("UICorner")
local PassError = Instance.new("TextLabel")

PassFrame.Name = "PasswordMenu"
PassFrame.Parent = MainGui
PassFrame.BackgroundColor3 = Color3.fromRGB(0, 180, 216) -- Cyan bas
PassFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PassFrame.Size = UDim2.new(0, 300, 0, 200)
PassFrame.Active = true
PassFrame.Draggable = true

PassCorner.CornerRadius = UDim.new(0, 14)
PassCorner.Parent = PassFrame

PassStroke.Thickness = 2
PassStroke.Color = Color3.fromRGB(224, 251, 252)
PassStroke.Parent = PassFrame

PassTitle.Size = UDim2.new(1, 0, 0, 45)
PassTitle.BackgroundTransparency = 1
PassTitle.Font = Enum.Font.SourceSansBold
PassTitle.Text = "SECURITY VERIFICATION"
PassTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PassTitle.TextSize = 18
PassTitle.Parent = PassFrame

PassInput.Size = UDim2.new(0.8, 0, 0, 40)
PassInput.Position = UDim2.new(0.1, 0, 0.3, 0)
PassInput.BackgroundColor3 = Color3.fromRGB(224, 251, 252)
PassInput.Font = Enum.Font.SourceSansBold
PassInput.PlaceholderText = "Enter Password Here..."
PassInput.Text = ""
PassInput.TextColor3 = Color3.fromRGB(20, 30, 40)
PassInput.TextSize = 16
PassInput.ClearTextOnFocus = true
PassInput.Parent = PassFrame

local InputCorner = Instance.new("UICorner", PassInput)
InputCorner.CornerRadius = UDim.new(0, 8)

PassBtn.Size = UDim2.new(0.8, 0, 0, 40)
PassBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
PassBtn.BackgroundColor3 = Color3.fromRGB(20, 30, 40)
PassBtn.Font = Enum.Font.SourceSansBold
PassBtn.Text = "Unlock Access"
PassBtn.TextColor3 = Color3.fromRGB(0, 180, 216)
PassBtn.TextSize = 16
PassBtn.Parent = PassFrame

PassBtnCorner.CornerRadius = UDim.new(0, 8)
PassBtnCorner.Parent = PassBtn

PassError.Size = UDim2.new(1, 0, 0, 25)
PassError.Position = UDim2.new(0, 0, 0.82, 0)
PassError.BackgroundTransparency = 1
PassError.Font = Enum.Font.SourceSansItalic
PassError.Text = ""
PassError.TextColor3 = Color3.fromRGB(242, 100, 25)
PassError.TextSize = 14
PassError.Parent = PassFrame

-- ==========================================
-- 2. MAIN SCRIPT MENU (LIGHT BLUE LUXURY)
-- ==========================================
local MainFrame = Instance.new("Frame")
local FrameCorner = Instance.new("UICorner")
local FrameStroke = Instance.new("UIStroke")
local FrameGradient = Instance.new("UIGradient")
local TitleLabel = Instance.new("TextLabel")
local DisclaimerLabel = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")

local TopBarControls = Instance.new("Frame")
local MinimizeBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

MainFrame.Name = "MainFrame"
MainFrame.Parent = MainGui
MainFrame.BackgroundColor3 = Color3.fromRGB(173, 216, 230) -- Ren ljusblå (Light Blue)
MainFrame.BackgroundTransparency = 0.15 
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -297)
MainFrame.Size = UDim2.new(0, 330, 0, 595) -- Optimerad höjd för alla 10 knappar
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Visible = false -- Dold tills lösenordet är godkänt

FrameCorner.CornerRadius = UDim.new(0, 16)
FrameCorner.Parent = MainFrame

FrameStroke.Thickness = 2.5
FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
FrameStroke.LineJoinMode = Enum.LineJoinMode.Round
FrameStroke.Parent = MainFrame

FrameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 130, 180)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
FrameGradient.Rotation = 45
FrameGradient.Parent = FrameStroke

UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

UIPadding.Parent = MainFrame
UIPadding.PaddingTop = UDim.new(0, 12)
UIPadding.PaddingLeft = UDim.new(0, 20)
UIPadding.PaddingRight = UDim.new(0, 20)

-- Toppkontroller (Minimize / Close)
TopBarControls.Name = "TopBarControls"
TopBarControls.Parent = MainFrame
TopBarControls.Size = UDim2.new(1, 0, 0, 20)
TopBarControls.BackgroundTransparency = 1
TopBarControls.LayoutOrder = 0

MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = TopBarControls
MinimizeBtn.Size = UDim2.new(0, 20, 0, 20)
MinimizeBtn.Position = UDim2.new(1, -45, 0, 0)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 190, 0)
MinimizeBtn.Text = "-"
MinimizeBtn.Font = Enum.Font.SourceSansBold
MinimizeBtn.TextSize = 16
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(1, 0)

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBarControls
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -20, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 12
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 0, 24)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "Script is by: Devy_mmvevade and nightshift485 on tiktok only."
TitleLabel.TextColor3 = Color3.fromRGB(25, 35, 45) 
TitleLabel.TextSize = 13
TitleLabel.TextWrapped = true
TitleLabel.LayoutOrder = 1

DisclaimerLabel.Name = "DisclaimerLabel"
DisclaimerLabel.Parent = MainFrame
DisclaimerLabel.BackgroundTransparency = 1
DisclaimerLabel.Size = UDim2.new(1, 0, 0, 14)
DisclaimerLabel.Font = Enum.Font.SourceSansBold
DisclaimerLabel.Text = "<DO NOT STEAL THIS SCRIPT, PLEASE>"
DisclaimerLabel.TextColor3 = Color3.fromRGB(180, 0, 0) -- Rättat syntaxfel
DisclaimerLabel.TextSize = 12
DisclaimerLabel.LayoutOrder = 2

-- ==========================================
-- 3. MINIMIZED BAR STATE
-- ==========================================
local MiniFrame = Instance.new("Frame")
local MiniCorner = Instance.new("UICorner")
local MiniStroke = Instance.new("UIStroke")
local MiniLabel = Instance.new("TextLabel")
local MaximizeBtn = Instance.new("TextButton")

MiniFrame.Name = "MiniFrame"
MiniFrame.Parent = MainGui
MiniFrame.BackgroundColor3 = Color3.fromRGB(173, 216, 230) -- Ljusblå rektangel
MiniFrame.Position = UDim2.new(0.5, -205, 0, 40)
MiniFrame.Size = UDim2.new(0, 410, 0, 36)
MiniFrame.Active = true
MiniFrame.Draggable = true
MiniFrame.Visible = false

MiniCorner.CornerRadius = UDim.new(0, 10)
MiniCorner.Parent = MiniFrame

MiniStroke.Thickness = 1.5
MiniStroke.Color = Color3.fromRGB(70, 130, 180)
MiniStroke.Parent = MiniFrame

MiniLabel.Size = UDim2.new(0.9, -10, 1, 0)
MiniLabel.Position = UDim2.new(0, 10, 0, 0)
MiniLabel.BackgroundTransparency = 1
MiniLabel.Font = Enum.Font.SourceSansBold
MiniLabel.Text = "Painel scripts CNP @devy_mmvevade @nightshift485"
MiniLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniLabel.TextSize = 13
MiniLabel.TextXAlignment = Enum.TextXAlignment.Left
MiniLabel.Parent = MiniFrame

MaximizeBtn.Size = UDim2.new(0, 26, 0, 26)
MaximizeBtn.Position = UDim2.new(1, -32, 0.5, -13)
MaximizeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MaximizeBtn.BackgroundTransparency = 0.2
MaximizeBtn.Font = Enum.Font.SourceSansBold
MaximizeBtn.Text = "+"
MaximizeBtn.TextColor3 = Color3.fromRGB(25, 35, 45)
MaximizeBtn.TextSize = 18
MaximizeBtn.Parent = MiniFrame
Instance.new("UICorner", MaximizeBtn).CornerRadius = UDim.new(0, 6)

-- ==========================================
-- 4. BUTTON GENERATOR
-- ==========================================
local BlowdryerBtn = Instance.new("TextButton")
local ButtonCorner1 = Instance.new("UICorner")
local ButtonStroke1 = Instance.new("UIStroke")

local CursorBtn = Instance.new("TextButton")
local ButtonCorner2 = Instance.new("UICorner")
local ButtonStroke2 = Instance.new("UIStroke")

local NoReloadBtn = Instance.new("TextButton")
local ButtonCorner3 = Instance.new("UICorner")
local ButtonStroke3 = Instance.new("UIStroke")

local KuromiBtn = Instance.new("TextButton")
local ButtonCorner4 = Instance.new("UICorner")
local ButtonStroke4 = Instance.new("UIStroke")

local CcAdminBtn = Instance.new("TextButton")
local ButtonCorner5 = Instance.new("UICorner")
local ButtonStroke5 = Instance.new("UIStroke")

local ThiiHubBtn = Instance.new("TextButton")
local ButtonCorner6 = Instance.new("UICorner")
local ButtonStroke6 = Instance.new("UIStroke")

local N4tHubBtn = Instance.new("TextButton")
local ButtonCorner7 = Instance.new("UICorner")
local ButtonStroke7 = Instance.new("UIStroke")

local GearSpawnerPanelBtn = Instance.new("TextButton")
local ButtonCorner8 = Instance.new("UICorner")
local ButtonStroke8 = Instance.new("UIStroke")

local DarkPegasusBtn = Instance.new("TextButton")
local ButtonCorner9 = Instance.new("UICorner")
local ButtonStroke9 = Instance.new("UIStroke")

local RainbowSwordBtn = Instance.new("TextButton")
local ButtonCorner10 = Instance.new("UICorner")
local ButtonStroke10 = Instance.new("UIStroke") local function StyleLuxuryButton(button, corner, stroke, order, text)
button.Parent = MainFrame
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundTransparency = 0.1
button.Size = UDim2.new(1, 0, 0, 36)
button.Font = Enum.Font.SourceSansBold
button.Text = text
button.TextColor3 = Color3.fromRGB(25, 35, 45)
button.TextSize = 13
button.LayoutOrder = order
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = button


stroke.Thickness = 1
stroke.Color = Color3.fromRGB(70, 130, 180)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = button
button.MouseEnter:Connect(function()
button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
stroke.Color = Color3.fromRGB(255, 255, 255)
end)
button.MouseLeave:Connect(function()
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.TextColor3 = Color3.fromRGB(25, 35, 45)
stroke.Color = Color3.fromRGB(70, 130, 180)
end)
end
StyleLuxuryButton(BlowdryerBtn, ButtonCorner1, ButtonStroke1, 3, "Blowdryer-gear spawner 💨🌬️")
StyleLuxuryButton(CursorBtn, ButtonCorner2, ButtonStroke2, 4, "Pan9iac custom cursor menu 🖱️✨")
StyleLuxuryButton(NoReloadBtn, ButtonCorner3, ButtonStroke3, 5, "NO RELOAD ANIM-EQUIP SOUND 🔫🎵")
StyleLuxuryButton(KuromiBtn, ButtonCorner4, ButtonStroke4, 6, "Kuromi hub menu 😈🖤")
StyleLuxuryButton(CcAdminBtn, ButtonCorner5, ButtonStroke5, 7, "Cc-admin-panel loader 👑🛠️")
StyleLuxuryButton(ThiiHubBtn, ButtonCorner6, ButtonStroke6, 8, "THII HUB-MENU SCRIPT ❤️📁")
StyleLuxuryButton(N4tHubBtn, ButtonCorner7, ButtonStroke7, 9, "N4T-PANEL HUB SCRIPT 💎⚡")
StyleLuxuryButton(GearSpawnerPanelBtn, ButtonCorner8, ButtonStroke8, 10, "GEAR-SPAWNER PANEL, CODE: Gear giver🔫🔨")
StyleLuxuryButton(DarkPegasusBtn, ButtonCorner9, ButtonStroke9, 11, "DARK-PEGASUS GEAR🖤🐦‍⬛")
StyleLuxuryButton(RainbowSwordBtn, ButtonCorner10, ButtonStroke10, 12, "RAINBOW-SWORD SPAWNER 🌈⚔️")
-- ==========================================
-- 5. FUNCTIONALITIES & EXECUTION LINKS
-- ==========================================
local function Authenticate()
if PassInput.Text == "Devyquit?" then
PassFrame:Destroy()
MainFrame.Visible = true
else
PassInput.Text = ""
PassError.Text = "⚠️ Incorrect password! Try again."
-- Skakeffekt vid felaktigt lösenord
local originalPos = PassFrame.Position
for i = 1, 8 do
PassFrame.Position = originalPos + UDim2.new(0, (i % 2 == 0 and 6 or -6), 0, 0)
task.wait(0.02)
end
PassFrame.Position = originalPos
end
end
PassBtn.MouseButton1Click:Connect(Authenticate)
PassInput.FocusLost:Connect(function(enterPressed)
if enterPressed then Authenticate() end
end)
-- Minimize, Maximize och stäng-handlingar
MinimizeBtn.MouseButton1Click:Connect(function()
MainFrame.Visible = false
MiniFrame.Visible = true
end)
MaximizeBtn.MouseButton1Click:Connect(function()
MiniFrame.Visible = false
MainFrame.Visible = true
end)
CloseBtn.MouseButton1Click:Connect(function()
MainGui:Destroy()
end)
-- Kopplingar för knapparnas skript med dina exakta raw-länkar
BlowdryerBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/l7rUVPB8/raw"))()
end)
end)
CursorBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/7Ty2RvC7/raw"))()
end)
end)
NoReloadBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/vrsaVPoy/raw"))()
end)
end)
KuromiBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/cXczkImO/raw"))()
end)
end)
CcAdminBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/antonioffxslegend-collab/Cc-adm-mmv-panel-mm2/main/script.lua"))()
end)
end)
ThiiHubBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/mico123kawai-ctrl/hub-old/refs/heads/main/message%20(4).txt"))()
end)
end)
N4tHubBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/xxy6nwVt/raw"))()
end)
end)
GearSpawnerPanelBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ahma174/Gear-Giver-Gui-1.5/refs/heads/main/Gear"))()
end)
end)
DarkPegasusBtn.MouseButton1Click:Connect(function()
pcall(function()
loadstring(game:HttpGet("https://pastefy.app/MVITXPKt/raw"))()
end)
end)
RainbowSwordBtn.MouseButton1Click:Connect(function()
pcall(function()
--[[
WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
task.spawn(function()
pcall(function()
loadstring(game:HttpGet("https://scriptblox.com/ingest/clientv2.lua"))("proj_d7454a74dba6", "1.0.0", false)
end)
end)
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GGSOZI/Rip-offPeriastron/refs/heads/main/Periastron.lua"))()
end)
end)
end)
