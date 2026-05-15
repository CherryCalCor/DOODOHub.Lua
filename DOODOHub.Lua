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
-- INFO BUTTON + PANEL
--========================

local InfoButton = Instance.new("TextButton")
InfoButton.Size = UDim2.new(0,40,0,20)
InfoButton.Position = UDim2.new(0,25,0,40)
InfoButton.BackgroundTransparency = 1
InfoButton.Text = "info"
InfoButton.Font = Enum.Font.Gotham
InfoButton.TextSize = 14
InfoButton.TextColor3 = Color3.fromRGB(220,220,220)
InfoButton.Parent = MainFrame
InfoButton.ZIndex = 4


-- INFO PAGE (внутри раздела info)

local InfoPage = Instance.new("Frame")
InfoPage.Size = UDim2.new(0,280,0,180)
InfoPage.Position = UDim2.new(0,115,0,45)

InfoPage.BackgroundColor3 =
Color3.fromRGB(0,140,255) -- цвет как обводка

InfoPage.BackgroundTransparency =
0.88 -- прозрачность

InfoPage.Visible =
false

InfoPage.Parent =
MainFrame


local InfoCorner =
Instance.new("UICorner")

InfoCorner.CornerRadius =
UDim.new(0,10)

InfoCorner.Parent =
InfoPage


local InfoStroke =
Instance.new("UIStroke")

InfoStroke.Color =
Color3.fromRGB(0,140,255)

InfoStroke.Thickness =
1

InfoStroke.Transparency =
0.3

InfoStroke.Parent =
InfoPage



local InfoTitle =
Instance.new("TextLabel")

InfoTitle.Size =
UDim2.new(1,0,0,30)

InfoTitle.BackgroundTransparency =
1

InfoTitle.Text =
"INFO"

InfoTitle.Font =
Enum.Font.GothamBold -- как DOODO HUB

InfoTitle.TextSize =
18

InfoTitle.TextColor3 =
Color3.new(1,1,1)

InfoTitle.Parent =
InfoPage



local InfoText =
Instance.new("TextLabel")

InfoText.Size =
UDim2.new(1,-10,1,-35)

InfoText.Position =
UDim2.new(0,10,0,35)

InfoText.BackgroundTransparency =
1

InfoText.TextWrapped =
true

InfoText.TextXAlignment =
Enum.TextXAlignment.Left

InfoText.TextYAlignment =
Enum.TextYAlignment.Top

InfoText.Font =
Enum.Font.GothamBold -- как DOODO HUB

InfoText.TextSize =
13

InfoText.TextColor3 =
Color3.fromRGB(255,255,255)

InfoText.Parent =
InfoPage

task.spawn(function()

	while true do

		local ping =
		math.floor(
		player:GetNetworkPing()*1000
		)

		local playerCount =
#game:GetService("Players"):GetPlayers()

		local fps =
		math.floor(workspace:GetRealPhysicsFPS())

		InfoText.Text =

"Version: 1.0\n\n"
..

"Executor:\n"
..
executorName
..

"\n\nFPS:\n"
..
fps
..

"\n\nPing:\n"
..
ping.." ms"
..

"\n\nPlayers:\n"
..
playerCount
..

"\n\nUser:\n"
..
player.Name

		task.wait(1)

	end

end)

local infoOpen =
false

InfoButton.MouseButton1Click:Connect(function()

	infoOpen =
	not infoOpen

	InfoPage.Visible =
	infoOpen

end)

--========================
-- TELEPORT BUTTON
--========================

local TeleportButton =
Instance.new("TextButton")

TeleportButton.Size =
UDim2.new(0,60,0,20)

TeleportButton.Position =
UDim2.new(0,25,0,65) -- ниже info

TeleportButton.BackgroundTransparency =
1

TeleportButton.Text =
"Teleport"

TeleportButton.Font =
Enum.Font.GothamBold

TeleportButton.TextSize =
14

TeleportButton.TextColor3 =
Color3.fromRGB(220,220,220)

TeleportButton.Parent =
MainFrame


local TPPage =
Instance.new("Frame")

TPPage.Size =
UDim2.new(0,280,0,180)

TPPage.Position =
UDim2.new(0,115,0,45)

TPPage.BackgroundColor3 =
Color3.fromRGB(0,140,255)

TPPage.BackgroundTransparency =
0.88

TPPage.Visible =
false

TPPage.Parent =
MainFrame


local TPCorner =
Instance.new("UICorner")

TPCorner.CornerRadius =
UDim.new(0,10)

TPCorner.Parent =
TPPage


local TPStroke =
Instance.new("UIStroke")

TPStroke.Color =
Color3.fromRGB(0,140,255)

TPStroke.Parent =
TPPage



-- PLAYER LIST

local PlayerList =
Instance.new("ScrollingFrame")

PlayerList.Size =
UDim2.new(0,110,1,-10)

PlayerList.Position =
UDim2.new(0,5,0,5)

PlayerList.CanvasSize =
UDim2.new()

PlayerList.BackgroundTransparency =
1

PlayerList.Parent =
TPPage


local layout =
Instance.new("UIListLayout")

layout.Parent =
PlayerList


-- PLAYER INFO RIGHT

local SelectedAvatar =
Instance.new("ImageLabel")

SelectedAvatar.Size =
UDim2.new(0,60,0,60)

SelectedAvatar.Position =
UDim2.new(0,150,0,20)

SelectedAvatar.BackgroundTransparency =
1

SelectedAvatar.Parent =
TPPage


local SelectedName =
Instance.new("TextLabel")

SelectedName.Size =
UDim2.new(0,100,0,20)

SelectedName.Position =
UDim2.new(0,130,0,90)

SelectedName.BackgroundTransparency =
1

SelectedName.Font =
Enum.Font.GothamBold

SelectedName.TextColor3 =
Color3.new(1,1,1)

SelectedName.Parent =
TPPage


local TPButton =
Instance.new("TextButton")

TPButton.Size =
UDim2.new(0,90,0,30)

TPButton.Position =
UDim2.new(0,135,0,120)

TPButton.Text =
"Teleport"

TPButton.Font =
Enum.Font.GothamBold

TPButton.BackgroundColor3 =
Color3.fromRGB(0,140,255)

TPButton.Parent =
TPPage


local selectedPlayer =
nil


for _,plr in pairs(
Players:GetPlayers()
) do

	local btn =
	Instance.new(
	"TextButton"
	)

	btn.Size =
	UDim2.new(1,0,0,25)

	btn.Text =
	plr.Name

	btn.Font =
	Enum.Font.GothamBold

	btn.Parent =
	PlayerList


	btn.MouseButton1Click:Connect(function()

		selectedPlayer =
		plr

		SelectedName.Text =
		plr.Name


		local img =
		Players:GetUserThumbnailAsync(
			plr.UserId,
			Enum.ThumbnailType.HeadShot,
			Enum.ThumbnailSize.Size100x100
		)

		SelectedAvatar.Image =
		img

	end)

end


TPButton.MouseButton1Click:Connect(function()

	if selectedPlayer
	and selectedPlayer.Character
	and player.Character then

		player.Character:
		PivotTo(

		selectedPlayer
		.Character
		:GetPivot()

		)

	end

end)



local tpOpen =
false

TeleportButton.MouseButton1Click:Connect(function()

	tpOpen =
	not tpOpen

	TPPage.Visible =
	tpOpen

	InfoPage.Visible =
	false

	infoOpen =
	false

end)

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
InfoButton.Visible = show
InfoPage.Visible =
show and infoOpen
TeleportButton.Visible = show
TPPage.Visible = false

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
