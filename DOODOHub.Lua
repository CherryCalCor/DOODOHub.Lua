--// Simple Roblox Hub GUI
--// LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--========================
-- MAIN GUI
--========================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HubGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 260)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.ZIndex = 2

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(0, 140, 255)
Stroke.Thickness = 1.2
Stroke.Transparency = 0.2
Stroke.Parent = MainFrame

--========================
-- TOP LINE
--========================

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, 0, 0, 1)
TopLine.Position = UDim2.new(0, 0, 0, 31)
TopLine.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TopLine.BackgroundTransparency = 0.25
TopLine.BorderSizePixel = 0
TopLine.Parent = MainFrame
TopLine.ZIndex = 2

--========================
-- TITLE
--========================

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "DOODO HUB"
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = MainFrame
Title.ZIndex = 3

--========================
-- EXECUTOR BOX (TOP CENTER)
--========================

local ExecutorFrame = Instance.new("Frame")
ExecutorFrame.Size = UDim2.new(0, 110, 0, 24)
ExecutorFrame.Position = UDim2.new(0.5, -55, 0, 4)
ExecutorFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
ExecutorFrame.BackgroundTransparency = 0.1
ExecutorFrame.BorderSizePixel = 0
ExecutorFrame.Parent = MainFrame
ExecutorFrame.ZIndex = 4

local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0,8)
ExecCorner.Parent = ExecutorFrame

local ExecStroke = Instance.new("UIStroke")
ExecStroke.Color = Color3.fromRGB(0,140,255)
ExecStroke.Thickness = 1
ExecStroke.Transparency = 0.3
ExecStroke.Parent = ExecutorFrame


local executorName = "Unknown"

pcall(function()
	if identifyexecutor then
		executorName = identifyexecutor()
	end
end)


local ExecutorLabel = Instance.new("TextLabel")
ExecutorLabel.Size = UDim2.new(1,0,1,0)
ExecutorLabel.BackgroundTransparency = 1
ExecutorLabel.Text =
	string.upper(executorName)
ExecutorLabel.Font = Enum.Font.GothamBold
ExecutorLabel.TextSize = 11
ExecutorLabel.TextColor3 = Color3.fromRGB(255,255,255)
ExecutorLabel.Parent = ExecutorFrame
ExecutorLabel.ZIndex = 5

--========================
-- LEFT LINE
--========================

local LeftLine = Instance.new("Frame")
LeftLine.Size = UDim2.new(0, 1, 1, -31)
LeftLine.Position = UDim2.new(0, 105, 0, 31)
LeftLine.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
LeftLine.BackgroundTransparency = 0.25
LeftLine.BorderSizePixel = 0
LeftLine.Parent = MainFrame
LeftLine.ZIndex = 2

--========================
-- INFO BUTTON
--========================

local InfoButton = Instance.new("TextButton")
InfoButton.Size = UDim2.new(0, 40, 0, 20)
InfoButton.Position = UDim2.new(0, 55, 0, 40) -- перед левой полоской
InfoButton.BackgroundTransparency = 1
InfoButton.BorderSizePixel = 0
InfoButton.Text = "info"
InfoButton.TextSize = 14
InfoButton.Font = Enum.Font.Gotham
InfoButton.TextColor3 = Color3.fromRGB(220,220,220)
InfoButton.TextXAlignment = Enum.TextXAlignment.Left
InfoButton.Parent = MainFrame
InfoButton.ZIndex = 4

--========================
-- BUTTONS (FIXED)
--========================

local function makeButton(text, pos)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 30, 0, 20)
	b.Position = pos
	b.BackgroundTransparency = 1
	b.Text = text
	b.TextSize = 18
	b.Font = Enum.Font.GothamBold
	b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.Parent = MainFrame
	b.ZIndex = 5
	b.Active = true
	return b
end

local MinimizeButton = makeButton("-", UDim2.new(1, -70, 0, 6))
local CloseButton = makeButton("X", UDim2.new(1, -35, 0, 6))

--========================
-- AVATAR + TEXT (FIXED VISIBILITY)
--========================

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 30, 0, 30)
AvatarImage.Position = UDim2.new(0, 10, 1, -82)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Parent = MainFrame
AvatarImage.ZIndex = 3

local thumb = Players:GetUserThumbnailAsync(
	player.UserId,
	Enum.ThumbnailType.HeadShot,
	Enum.ThumbnailSize.Size100x100
)

AvatarImage.Image = thumb

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0, 200, 0, 18)
WelcomeLabel.Position = UDim2.new(0, 10, 1, -48)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "Welcome,"
WelcomeLabel.TextSize = 12
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeLabel.Parent = MainFrame
WelcomeLabel.ZIndex = 3

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(0, 200, 0, 18)
NameLabel.Position = UDim2.new(0, 10, 1, -32)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = player.Name
NameLabel.TextSize = 12
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
NameLabel.Parent = MainFrame
NameLabel.ZIndex = 3

--========================
-- MINIMIZE FIX
--========================

local minimized = false
local fullSize = MainFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized

	local show = not minimized
	AvatarImage.Visible = show
	WelcomeLabel.Visible = show
	NameLabel.Visible = show

	if minimized then
		MainFrame.Size = UDim2.new(fullSize.X.Scale, fullSize.X.Offset, 0, 40)
	else
		MainFrame.Size = fullSize
	end
end)

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

--========================
-- DH BUTTON (FIXED + ALWAYS WORKS)
--========================

local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "ToggleDH"
ToggleGui.ResetOnSpawn = false
ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ToggleGui.Parent = player:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -22)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Text = "DH"
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.fromRGB(0, 140, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = ToggleGui
ToggleButton.ZIndex = 10
ToggleButton.Active = true

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0, 10)
Corner2.Parent = ToggleButton

local Stroke2 = Instance.new("UIStroke")
Stroke2.Color = Color3.fromRGB(0, 140, 255)
Stroke2.Thickness = 1.2
Stroke2.Transparency = 0.2
Stroke2.Parent = ToggleButton

-- FIXED DRAG
local dragging = false
local dragStart
local startPos

ToggleButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = UserInputService:GetMouseLocation()
		startPos = ToggleButton.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = UserInputService:GetMouseLocation() - dragStart

		ToggleButton.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

-- TOGGLE GUI
ToggleButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)
