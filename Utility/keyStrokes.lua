local keystrokes = Instance.new("ScreenGui")
keystrokes.Name = "Keystrokes"
keystrokes.Enabled = false
keystrokes.Parent = game.CoreGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = keystrokes
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 110, 0, 207)
main.Draggable = true

local labels = {
    W = {KeyCode = Enum.KeyCode.W, Position = UDim2.new(0.5, 0, 0, 0)},
    S = {KeyCode = Enum.KeyCode.S, Position = UDim2.new(0.5, 0, 0, 39)},
    A = {KeyCode = Enum.KeyCode.A, Position = UDim2.new(0, 0, 0, 39)},
    D = {KeyCode = Enum.KeyCode.D, Position = UDim2.new(1, 0, 0, 39)},
    Space = {KeyCode = Enum.KeyCode.Space, Position = UDim2.new(0.5, 0, 0, 116)},
    MouseButton1 = {UserInputType = Enum.UserInputType.MouseButton1, Position = UDim2.new(0, 0, 0, 78)},
    MouseButton2 = {UserInputType = Enum.UserInputType.MouseButton2, Position = UDim2.new(1, 0, 0, 78)},
}

for name, data in pairs(labels) do
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Parent = main
    label.BackgroundColor3 = Color3.new(0, 0, 0)
    label.BackgroundTransparency = 0.6
    label.BorderSizePixel = 0
    label.Position = data.Position
    label.Size = UDim2.new(0, 34, 0, 35)
    label.Font = Enum.Font.Gotham
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 16

    label.InputBegan:Connect(function(input)
        if input.UserInputType == data.UserInputType or input.KeyCode == data.KeyCode then
            label.BackgroundColor3 = Color3.new(1, 1, 1)
            label.TextColor3 = Color3.new(0, 0, 0)
        end
    end)

    label.InputEnded:Connect(function(input)
        if input.UserInputType == data.UserInputType or input.KeyCode == data.KeyCode then
            label.BackgroundColor3 = Color3.new(0, 0, 0)
            label.TextColor3 = Color3.new(1, 1, 1)
        end
    end)
end

local cpsLabel = Instance.new("TextLabel")
cpsLabel.Name = "CPS"
cpsLabel.Parent = main
cpsLabel.AnchorPoint = Vector2.new(0.5, 0)
cpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
cpsLabel.BackgroundTransparency = 0.6
cpsLabel.BorderSizePixel = 0
cpsLabel.Position = UDim2.new(0.5, 0, 0, 144)
cpsLabel.Size = UDim2.new(0, 110, 0, 25)
cpsLabel.Font = Enum.Font.Gotham
cpsLabel.Text = "0 | 0 CPS"
cpsLabel.TextColor3 = Color3.new(1, 1, 1)
cpsLabel.TextSize = 16

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FPS"
fpsLabel.Parent = main
fpsLabel.AnchorPoint = Vector2.new(0.5, 0)
fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
fpsLabel.BackgroundTransparency = 0.6
fpsLabel.BorderSizePixel = 0
fpsLabel.Position = UDim2.new(0.5, 0, 0, 172)
fpsLabel.Size = UDim2.new(0, 110, 0, 25)
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.Text = "0 FPS"
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.TextSize = 16

-- Functions:
local function updateCPSLabel(clicks, cps)
    cpsLabel.Text = tostring(clicks) .. "| " .. tostring(cps) .. " CPS"
end

local function updateFPSLabel(fps)
    fpsLabel.Text = tostring(fps) .. " FPS"
end

local function toggleKeystrokes()
    keystrokes.Enabled = not keystrokes.Enabled
end

-- Connections:
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Tab then
        toggleKeystrokes()
    end
end)

-- Initialization:
local clicks = 0
local lastClick = tick()
local running = true
local fps = 0

coroutine.wrap(function()
    while running do
        local startTick = tick()

        fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())

        updateFPSLabel(fps)

        local deltaTime = tick() - lastClick

        if deltaTime >= 1 then
            local cps = math.floor(clicks / deltaTime)

            updateCPSLabel(clicks, cps)

            clicks = 0
            lastClick = tick()
        end

        wait(0.01)
    end
end)()

game:GetService("Players").LocalPlayer:GetMouse().Button1Down:Connect(function()
    clicks = clicks + 1
end)
