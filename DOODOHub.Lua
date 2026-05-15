--// Simple Roblox Hub GUI
--// LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TeleportService =
game:GetService("TeleportService")

local HttpService =
game:GetService("HttpService")

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


--========================
-- TELEPORT BUTTON
--========================

local TeleportButton =
Instance.new("TextButton")

TeleportButton.Size =
UDim2.new(0,70,0,20)

TeleportButton.Position =
UDim2.new(0,25,0,65)

TeleportButton.BackgroundTransparency =
1

TeleportButton.BorderSizePixel =
0

TeleportButton.Text =
"teleport"

TeleportButton.Font =
Enum.Font.GothamBold

TeleportButton.TextSize =
14

TeleportButton.TextColor3 =
Color3.fromRGB(
220,220,220
)

TeleportButton.Parent =
MainFrame

TeleportButton.ZIndex =
4



-- PAGE

local TPPage =
Instance.new("ScrollingFrame")

TPPage.Size =
UDim2.new(0,280,0,180) -- обратно меньше

TPPage.Position =
UDim2.new(0,115,0,45)

TPPage.CanvasSize =
UDim2.new(0,0,0,260) -- область прокрутки

TPPage.ScrollBarThickness =
4

TPPage.AutomaticCanvasSize =
Enum.AutomaticSize.Y

TPPage.Visible =
false

TPPage.BackgroundColor3 =
Color3.fromRGB(0,140,255)

TPPage.BackgroundTransparency =
0.88

TPPage.BorderSizePixel =
0

TPPage.Parent =
MainFrame

TPPage.ZIndex =
4


local tpCorner =
Instance.new("UICorner")

tpCorner.CornerRadius =
UDim.new(0,10)

tpCorner.Parent =
TPPage


local tpPageStroke =
Instance.new("UIStroke")

tpPageStroke.Color =
Color3.fromRGB(0,140,255)

tpPageStroke.Thickness =
1

tpPageStroke.Transparency =
0.3

tpPageStroke.Parent =
TPPage


-- LIST

local PlayerList =
Instance.new(
"ScrollingFrame"
)

PlayerList.Parent =
TPPage

PlayerList.Size =
UDim2.new(0,120,0,160)

PlayerList.Position =
UDim2.new(0,5,0,5)

PlayerList.BackgroundTransparency =
1

PlayerList.ScrollBarThickness =
4

PlayerList.AutomaticCanvasSize =
Enum.AutomaticSize.Y

PlayerList.CanvasSize =
UDim2.new()

PlayerList.BorderSizePixel =
0



local layout =
Instance.new(
"UIListLayout"
)

layout.Parent =
PlayerList

layout.Padding =
UDim.new(0,4)



-- RIGHT INFO

local SelectedAvatar =
Instance.new(
"ImageLabel"
)

SelectedAvatar.Parent =
TPPage

SelectedAvatar.Size =
UDim2.new(0,70,0,70)

SelectedAvatar.Position =
UDim2.new(0,165,0,15)

SelectedAvatar.BackgroundTransparency =
1



local SelectedName =
Instance.new(
"TextLabel"
)

SelectedName.Parent =
TPPage

SelectedName.Position =
UDim2.new(0,135,0,95)

SelectedName.Size =
UDim2.new(0,120,0,20)

SelectedName.BackgroundTransparency =
1

SelectedName.Font =
Enum.Font.GothamBold

SelectedName.TextColor3 =
Color3.new(1,1,1)



local TPButton =
Instance.new("TextButton")

TPButton.Parent =
TPPage

TPButton.Size =
UDim2.new(0,100,0,30)

TPButton.Position =
UDim2.new(0,145,0,125)

TPButton.Text =
"Teleport"

TPButton.Font =
Enum.Font.GothamBold

TPButton.TextSize =
14

TPButton.TextColor3 =
Color3.new(1,1,1)

TPButton.TextStrokeTransparency =
1 -- УБИРАЕТ ОБВОДКУ ТЕКСТА

TPButton.BackgroundColor3 =
Color3.fromRGB(20,20,20)

TPButton.BackgroundTransparency =
0

TPButton.BorderSizePixel =
0

TPButton.AutoButtonColor =
false

local tpStroke =
Instance.new("UIStroke")

tpStroke.Color =
Color3.fromRGB(
0,140,255
)

tpStroke.Thickness =
1

tpStroke.Transparency =
0.3

tpStroke.Parent =
TPButton

Instance.new(
"UICorner",
TPButton
).CornerRadius =
UDim.new(0,8)



local selectedPlayer


local function refreshPlayers()

	PlayerList:ClearAllChildren()

	local layout =
	Instance.new("UIListLayout")

	layout.Parent =
	PlayerList

	layout.Padding =
	UDim.new(0,4)


	for _,plr in ipairs(
	Players:GetPlayers()
	) do

		local btn =
Instance.new("TextButton")

btn.Parent =
PlayerList

btn.Size =
UDim2.new(
	1,-5,
	0,28
)

btn.Text =
plr.Name

btn.Font =
Enum.Font.GothamBold

btn.TextSize =
13

btn.TextColor3 =
Color3.new(1,1,1)

btn.TextStrokeTransparency =
1

btn.BackgroundColor3 =
Color3.fromRGB(20,20,20)

btn.BackgroundTransparency =
0.1

btn.BorderSizePixel =
0

btn.AutoButtonColor =
false

-- скругление
local corner =
Instance.new("UICorner")

corner.CornerRadius =
UDim.new(0,7)

corner.Parent =
btn


-- ОДНА обводка как у ExecutorFrame
local stroke =
Instance.new("UIStroke")

stroke.Color =
Color3.fromRGB(
0,140,255
)

stroke.Thickness =
1

stroke.Transparency =
0.3

stroke.Parent =
btn

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

end



refreshPlayers()

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)



TPButton.MouseButton1Click:
Connect(function()

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

local infoOpen =
false

InfoButton.MouseButton1Click:Connect(function()

	infoOpen =
	not infoOpen

	InfoPage.Visible =
	infoOpen

	if infoOpen then
		TPPage.Visible =
		false

		tpOpen =
		false
	end

end)


TeleportButton.MouseButton1Click:Connect(function()

	tpOpen =
	not tpOpen

	TPPage.Visible =
	tpOpen

	if tpOpen then
		InfoPage.Visible =
		false

		infoOpen =
		false
	end

end)

--========================
-- GET TELEPORT TOOL BUTTON
--========================

local ToolButton =
Instance.new("TextButton")

ToolButton.Parent =
TPPage

ToolButton.Size =
UDim2.new(0,120,0,30)

ToolButton.Position =
UDim2.new(0,140,0,200) -- ниже Teleport

ToolButton.Text =
"Teleport Tool"

ToolButton.Font =
Enum.Font.GothamBold -- как DOODO HUB

ToolButton.TextSize =
14

ToolButton.TextColor3 =
Color3.new(1,1,1)

ToolButton.BackgroundColor3 =
Color3.fromRGB(25,25,25)

ToolButton.BorderSizePixel =
0

ToolButton.AutoButtonColor =
false


local toolCorner =
Instance.new("UICorner")

toolCorner.CornerRadius =
UDim.new(0,8)

toolCorner.Parent =
ToolButton


-- ОБВОДКА как ExecutorFrame

local toolStroke =
Instance.new("UIStroke")

toolStroke.Color =
Color3.fromRGB(
0,140,255
)

toolStroke.Thickness =
1

toolStroke.Transparency =
0.3

toolStroke.Parent =
ToolButton


ToolButton.MouseButton1Click:Connect(function()

	local tool =
	Instance.new("Tool")

	tool.Name =
	"Teleport Tool"

	tool.RequiresHandle =
	false

	tool.CanBeDropped =
	false


	tool.Activated:Connect(function()

		local mouse =
		player:GetMouse()

		local pos =
		mouse.Hit.Position

		if player.Character then

			player.Character:
			PivotTo(
				CFrame.new(
					pos + Vector3.new(0,3,0)
				)
			)

		end

	end)

	tool.Parent =
	player.Backpack

end)

local ServerButton =
Instance.new("TextButton")

ServerButton.Size =
UDim2.new(0,70,0,20)

ServerButton.Position =
UDim2.new(0,25,0,90)

ServerButton.BackgroundTransparency =
1

ServerButton.Text =
"server"

ServerButton.Font =
Enum.Font.GothamBold

ServerButton.TextSize =
14

ServerButton.TextColor3 =
Color3.fromRGB(220,220,220)

ServerButton.Parent =
MainFrame

local ServerPage =
Instance.new("Frame")

ServerPage.Parent =
MainFrame

ServerPage.Size =
UDim2.new(0,280,0,180)

ServerPage.Position =
UDim2.new(0,115,0,45)

ServerPage.BackgroundColor3 =
Color3.fromRGB(0,140,255)

ServerPage.BackgroundTransparency =
0.88

ServerPage.Visible =
false

Instance.new(
"UICorner",
ServerPage
).CornerRadius =
UDim.new(0,10)

local sStroke =
Instance.new("UIStroke")

sStroke.Parent =
ServerPage

sStroke.Color =
Color3.fromRGB(0,140,255)

sStroke.Transparency =
0.3

local Rejoin =
Instance.new("TextButton")

Rejoin.Parent =
ServerPage

Rejoin.Size =
UDim2.new(0,120,0,30)

Rejoin.Position =
UDim2.new(0,10,0,15)

Rejoin.Text =
"Rejoin"

Rejoin.MouseButton1Click:Connect(function()

TeleportService:
Teleport(
game.PlaceId,
player
)

end)

local Hop =
Rejoin:Clone()

Hop.Parent =
ServerPage

Hop.Position =
UDim2.new(0,10,0,55)

Hop.Text =
"Server Hop"


Hop.MouseButton1Click:Connect(function()

local servers =
game.HttpService:
JSONDecode(

game:HttpGet(
"https://games.roblox.com/v1/games/"
..
game.PlaceId
..
"/servers/Public?limit=100"
)

)

local possible={}

for _,v in pairs(
servers.data
) do

if v.playing <
v.maxPlayers then

table.insert(
possible,
v.id
)

end

end

if #possible>0 then

TeleportService:
TeleportToPlaceInstance(

game.PlaceId,

possible[
math.random(
1,
#possible
)
],

player

)

end

end)

local List =
Rejoin:Clone()

List.Parent =
ServerPage

List.Position =
UDim2.new(0,10,0,95)

List.Text =
"Server List"

List.MouseButton1Click:Connect(function()

	TopServer.Visible =
	not TopServer.Visible

	ServerList.Visible =
	TopServer.Visible

end)

local ServerGui =
Instance.new("ScreenGui")

ServerGui.Parent =
player.PlayerGui

ServerGui.ResetOnSpawn = false

ServerGui.ZIndexBehavior =
Enum.ZIndexBehavior.Sibling

local TopServer =
Instance.new("TextButton")

TopServer.Parent =
ServerGui

TopServer.Size =
UDim2.new(0,180,0,40)

TopServer.Position =
UDim2.new(.5,-90,0,15)

TopServer.BackgroundColor3 =
Color3.fromRGB(20,20,20)

TopServer.BorderSizePixel =
0

TopServer.AutoButtonColor =
false

TopServer.Visible =
false -- скрыт при запуске

TopServer.Text = ""

Instance.new(
"UICorner",
TopServer
).CornerRadius =
UDim.new(0,10)

local topStroke =
Instance.new("UIStroke")

topStroke.Parent =
TopServer

topStroke.Color =
Color3.fromRGB(0,140,255)

topStroke.Transparency =
0.3

Instance.new(
"UICorner",
TopServer
).CornerRadius =
UDim.new(0,10)


local st =
Instance.new("UIStroke")

st.Parent =
TopServer

st.Color =
Color3.fromRGB(
0,140,255
)

local Dot =
Instance.new("Frame")

Dot.Parent =
TopServer

Dot.Size =
UDim2.new(0,8,0,8)

Dot.Position =
UDim2.new(0,12,.5,-4)

Dot.BackgroundColor3 =
Color3.fromRGB(
0,140,255
)

Instance.new(
"UICorner",
Dot
).CornerRadius =
UDim.new(1,0)

local Label =
Instance.new("TextLabel")

Label.Parent =
TopServer

Label.Text =
"Servers"

Label.Size =
UDim2.new(1,0,1,0)

Label.BackgroundTransparency =
1

Label.Font =
Enum.Font.GothamBold

Label.TextColor3 =
Color3.new(1,1,1)

local Min =
Instance.new("ImageButton")

Min.Parent =
TopServer

Min.Size =
UDim2.new(0,24,0,24)

Min.Position =
UDim2.new(1,-55,.5,-12)

Min.BackgroundTransparency =
1

Min.Image =
"rbxassetid://6031094678" -- минус



local Sort =
Instance.new("ImageButton")

Sort.Parent =
TopServer

Sort.Size =
UDim2.new(0,24,0,24)

Sort.Position =
UDim2.new(1,-28,.5,-12)

Sort.BackgroundTransparency =
1

Sort.Image =
"rbxassetid://6034818372" -- сортировка

Sort.Position =
UDim2.new(
1,-25,
0,0
)

Sort.Size =
UDim2.new(
0,20,
1,0
)

local ServerList =
Instance.new(
"ScrollingFrame"
)

ServerList.BackgroundColor3 =
Color3.fromRGB(20,20,20)

ServerList.BorderSizePixel =
0

ServerList.CanvasSize =
UDim2.new(0,0,0,5000)

ServerList.ScrollBarThickness =
4

Instance.new(
"UICorner",
ServerList
).CornerRadius =
UDim.new(0,12)

local stroke =
Instance.new("UIStroke")

stroke.Parent =
ServerList

stroke.Color =
Color3.fromRGB(0,140,255)

stroke.Transparency =
0.3


local layout =
Instance.new(
"UIListLayout"
)

layout.Parent =
ServerList

layout.Padding =
UDim.new(0,5)

ServerList.Parent =
ServerGui

ServerList.Size =
UDim2.new(
0,400,
0,300
)

ServerList.Position =
UDim2.new(
.5,-200,
0,65
)

ServerList.Visible =
false

local success,response =
pcall(function()

	return HttpService:JSONDecode(
		HttpService:GetAsync(
			"https://games.roblox.com/v1/games/"
			..
			game.PlaceId
			..
			"/servers/Public?limit=100"
		)
	)

end)


if success and response.data then

	for _,server in pairs(response.data) do

		local join =
		Instance.new("TextButton")

		join.Parent =
		ServerList

		join.Size =
		UDim2.new(1,-10,0,35)

		join.Text =
		"Players: "
		..
		server.playing
		..
		"/"
		..
		server.maxPlayers

		join.Font =
		Enum.Font.GothamBold

		join.TextColor3 =
		Color3.new(1,1,1)

		join.BackgroundColor3 =
		Color3.fromRGB(20,20,20)

		join.BorderSizePixel =
		0


		Instance.new(
		"UICorner",
		join
		).CornerRadius =
		UDim.new(0,8)


		local stroke =
		Instance.new("UIStroke")

		stroke.Parent =
		join

		stroke.Color =
		Color3.fromRGB(
		0,140,255
		)

		stroke.Transparency =
		0.3


		join.MouseButton1Click:
		Connect(function()

			TeleportService:
			TeleportToPlaceInstance(

				game.PlaceId,

				server.id,

				player

			)

		end)

	end

end

local serverOpen=false

ServerButton.MouseButton1Click:Connect(function()

	serverOpen =
	not serverOpen

	ServerPage.Visible =
	serverOpen

	TPPage.Visible =
	false
	InfoPage.Visible =
	false

	tpOpen =
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
