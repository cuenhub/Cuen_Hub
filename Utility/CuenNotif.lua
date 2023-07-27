local Notification = {}

local GUI = game:GetService("CoreGui"):FindFirstChild("CuenNotification")

function Notification:Notify(nofdebug, middledebug, all)
local SelectedType = string.lower(tostring(middledebug.Type))
local ambientShadow = Instance.new("ImageLabel")
local Window = Instance.new("Frame")
local Outline_A = Instance.new("Frame")
local WindowTitle = Instance.new("TextLabel")
local WindowDescription = Instance.new("TextLabel")
local Deny = Instance.new("ImageButton")
local Agree = Instance.new("ImageButton")
local Divider = Instance.new("Frame")

ambientShadow.Name = "ambientShadow"
ambientShadow.Parent = GUI
ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow.BackgroundTransparency = 1.000
ambientShadow.BorderSizePixel = 0
ambientShadow.Position = UDim2.new(0.821207345, 0, 0.871632278, 0)
ambientShadow.Size = UDim2.new(0, 0, 0, 0)
ambientShadow.Image = "rbxassetid://1316045217"
ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
ambientShadow.ImageTransparency = 0.400
ambientShadow.ScaleType = Enum.ScaleType.Slice
ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

Window.Name = "Window"
Window.Parent = ambientShadow
Window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Window.BorderSizePixel = 0
Window.Position = UDim2.new(0.013515179, 0, 0.0407798365, 0)
Window.Size = UDim2.new(0.971153855, 0, 0.90322578, 0)
Window.ZIndex = 2

Outline_A.Name = "Outline_A"
Outline_A.Parent = Window
Outline_A.BackgroundColor3 = middledebug.OutlineColor
Outline_A.BorderSizePixel = 0
Outline_A.Position = UDim2.new(0, 0, 0, 25)
Outline_A.Size = UDim2.new(0, 230, 0, 2)
Outline_A.ZIndex = 5

WindowTitle.Name = "WindowTitle"
WindowTitle.Parent = Window
WindowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WindowTitle.BackgroundTransparency = 1.000
WindowTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
WindowTitle.BorderSizePixel = 0
WindowTitle.Position = UDim2.new(0.0445544571, 0, 0.125, 0)
WindowTitle.Size = UDim2.new(0.915841579, 0, 0.285714298, 0)
WindowTitle.ZIndex = 4
WindowTitle.Font = Enum.Font.SourceSans
WindowTitle.Text = nofdebug.Title
WindowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
WindowTitle.TextScaled = true
WindowTitle.TextSize = 14.000
WindowTitle.TextWrapped = true
WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

WindowDescription.Name = "WindowDescription"
WindowDescription.Parent = Window
WindowDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WindowDescription.BackgroundTransparency = 1.000
WindowDescription.BorderColor3 = Color3.fromRGB(27, 42, 53)
WindowDescription.BorderSizePixel = 0
WindowDescription.Position = UDim2.new(0.0445544571, 0, 0.517857134, 0)
WindowDescription.Size = UDim2.new(0.673267305, 0, 0.375, 0)
WindowDescription.ZIndex = 4
WindowDescription.Font = Enum.Font.SourceSans
WindowDescription.Text = nofdebug.Description
WindowDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
WindowDescription.TextScaled = true
WindowDescription.TextSize = 14.000
WindowDescription.TextWrapped = true
WindowDescription.TextXAlignment = Enum.TextXAlignment.Left
WindowDescription.TextYAlignment = Enum.TextYAlignment.Top

Deny.Name = "Deny"
Deny.Parent = Window
Deny.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Deny.BackgroundTransparency = 1.000
Deny.Position = UDim2.new(0.14705883, 0, 0.839285731, 0)
Deny.Size = UDim2.new(0, 50, 0, 50)
Deny.ZIndex = 5
Deny.Image = "http://www.roblox.com/asset/?id=4334829743"
Deny.ImageColor3 = middledebug.DenyColor

Agree.Name = "Agree"
Agree.Parent = Window
Agree.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Agree.BackgroundTransparency = 1.000
Agree.Position = UDim2.new(0.690441489, 0, 0.839285731, 0)
Agree.Size = UDim2.new(0, 50, 0, 50)
Agree.ZIndex = 5
Agree.Image = "http://www.roblox.com/asset/?id=4334829743"
Agree.ImageColor3 = middledebug.AgreeColor

Divider.Name = "Divider"
Divider.Parent = Window
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0.027472527, 0, 0.794642866, 0)
Divider.Size = UDim2.new(0.946428597, 0, 0.00793650838, 0)
Divider.ZIndex = 5

local function TweenShadow()
    local info = TweenInfo.new(0.2)
    local tween = game:GetService("TweenService"):Create(ambientShadow, info, {Size = UDim2.new(1,0,1,0)})
    tween:Play()
    wait(1.5)
    local info = TweenInfo.new(0.2)
    local tween = game:GetService("TweenService"):Create(ambientShadow, info, {Size = UDim2.new(0,0,0,0)})
    tween:Play()
end

local function Callback(callbackType)
    if callbackType == "Deny" then
        middledebug.DenyCallback()
    elseif callbackType == "Agree" then
        middledebug.AgreeCallback()
    end
    ambientShadow:Destroy()
end

Deny.MouseButton1Click:Connect(function()
    Callback("Deny")
end)

Agree.MouseButton1Click:Connect(function()
    Callback("Agree")
end)

TweenShadow()
end

return Notification
