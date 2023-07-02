function newPrint(text)
    print('[Cuen ESP]: '..text)
end
function round(n) 
    return math.floor(n + 0.5) 
end

newPrint('Waiting for game to load.')


newPrint('Initialized Cuen ES!P')

pcall(function()
    for _,v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
           for _,c in pairs(v.Character:GetDescendants()) do
                if c:IsA('BillboardGui') or c:IsA('BoxHandleAdornment') then
                    c:Destroy()
                end
           end  
        end
    end
end)

-- Settings
local Settings = {
    Enabled               = false,
    Titles = {
        Enabled           = false,
        Name              = false,
        Distance          = false,
        TeamTextColor     = Color3.fromRGB(0, 255, 0),
        EnemyTextColor    = Color3.fromRGB(255, 0, 0)
    },
    Chams = {
        Enabled           = false,
        Transparency      = 0.5,
        TeamHeadColor     = Color3.fromRGB(0, 255, 0),
        TeamBodyColor     = Color3.fromRGB(0, 255, 0),
        EnemyHeadColor    = Color3.fromRGB(255, 0, 0),
        EnemyBodyColor    = Color3.fromRGB(255, 255, 0)
    },
    Box = {
        Enabled           = false,
        Transparency      = 0.5,
        TeamBoxColor      = Color3.fromRGB(0, 255, 0),
        EnemyBoxColor     = Color3.fromRGB(255, 0, 0),
        BoxOutlineColor   = Color3.fromRGB(255, 255, 255)
    },
    TeamCheck             = false
}

local Players     = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

while wait() do
    if Settings.Enabled then
        pcall(function()
            for _,v in pairs(Players:GetPlayers()) do
                wait()
                if v ~= LocalPlayer then
                    if Settings.TeamCheck then
                        if v.Team.Name ~= LocalPlayer.Team.Name or v.Team.TeamColor ~= LocalPlayer.TeamColor then
                            for _,c in pairs(v.Character:GetDescendants()) do
                                if c:IsA('BillboardGui') or c:IsA('BoxHandleAdornment') then
                                    c:Destroy()
                                end
        
                                if Settings.Chams.Enabled then
                                    if c:IsA('Part') or c:IsA('MeshPart') then
                                        if c.Name == 'Head' then
                                            local Box = Instance.new('BoxHandleAdornment', c)
                                            Box.Size = Box.Parent.Size
                                            Box.Transparency = Settings.Chams.Transparency
                                            Box.Adornee = Box.Parent
                                            Box.AlwaysOnTop = true
                                            Box.Visible = true
                                            Box.ZIndex = 2
                                            Box.Color3 = Settings.Chams.EnemyHeadColor
                                            Box.Name = HttpService:GenerateGUID(false):lower():sub(1, 10);
                                        else
                                            local Box = Instance.new('BoxHandleAdornment', c)
                                            Box.Size = Box.Parent.Size
                                            Box.Transparency = Settings.Chams.Transparency
                                            Box.Adornee = Box.Parent
                                            Box.AlwaysOnTop = true
                                            Box.Visible = true
                                            Box.ZIndex = 2
                                            Box.Color3 = Settings.Chams.EnemyBodyColor
                                            Box.Name = HttpService:GenerateGUID(false):lower():sub(1, 10);
                                        end
                                    end
                                end

                                if Settings.Box.Enabled then
                                    if c.Name == 'HumanoidRootPart' then
                                        local GUI = Instance.new('BillboardGui', c)
                                        local Frame = Instance.new('Frame', GUI)
    
                                        GUI.Adornee = c
                                        GUI.Size = UDim2.new(0.7, 0, 1, 0)
                                        GUI.StudsOffset = Vector3.new(-1.3, 2, 0)
                                        GUI.Parent = c
                                        GUI.AlwaysOnTop = true
    
                                        Frame.BackgroundTransparency = Settings.Box.Transparency
                                        Frame.ZIndex = 5
                                        Frame.Size = UDim2.new(5, 0, 5, 0)
                                        Frame.BackgroundColor3 = Settings.Box.EnemyBoxColor
                                        Frame.BorderColor3 = Settings.Box.BoxOutlineColor
                                    end
                                end
        
                                if Settings.Titles.Enabled then
                                    if c.Name == 'Head' then
                                        if Settings.Titles.Name then
                                            local DistanceFromPlayer = (LocalPlayer.Character.PrimaryPart.Position - v.Character.PrimaryPart.Position).Magnitude
                                            local GUI = Instance.new('BillboardGui', c)
                                            local Label = Instance.new('TextLabel', GUI)
            
                                            GUI.Adornee = c
                                            GUI.Size = UDim2.new(12, 0, 1, 0)
                                            GUI.StudsOffset = Vector3.new(0, 2, 0)
                                            GUI.Parent = c
                                            GUI.AlwaysOnTop = true
            
                                            if Settings.Titles.Distance then
                                                Label.BackgroundTransparency = 1
                                                Label.ZIndex = 5
                                                Label.Size = UDim2.new(1, 0, 1, 0)
                                                Label.TextColor3 = Settings.Titles.EnemyTextColor
                                                Label.TextScaled = false
                                                Label.Text = v.Name..'\n['..round(DistanceFromPlayer)..'] Studs Away'
                                                Label.TextStrokeTransparency = 0
                                                Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                            else
                                                Label.BackgroundTransparency = 1
                                                Label.ZIndex = 5
                                                Label.Size = UDim2.new(1, 0, 1, 0)
                                                Label.TextColor3 = Settings.Titles.EnemyTextColor
                                                Label.TextScaled = false
                                                Label.Text = v.Name
                                                Label.TextStrokeTransparency = 0
                                                Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                            end
                                        end
                                    end
                                end
                            end
                        else

                        end
                    else
                        for _,c in pairs(v.Character:GetDescendants()) do
                            if c:IsA('BillboardGui') or c:IsA('BoxHandleAdornment') then
                                c:Destroy()
                            end
    
                            if Settings.Chams.Enabled then
                                if c:IsA('Part') or c:IsA('MeshPart') then
                                    if c.Name == 'Head' then
                                        local Box = Instance.new('BoxHandleAdornment', c)
                                        Box.Size = Box.Parent.Size
                                        Box.Transparency = Settings.Chams.Transparency
                                        Box.Adornee = Box.Parent
                                        Box.AlwaysOnTop = true
                                        Box.Visible = true
                                        Box.ZIndex = 2
                                        Box.Color3 = Settings.Chams.TeamHeadColor
                                        Box.Name = HttpService:GenerateGUID(false):lower():sub(1, 10);
                                    else
                                        local Box = Instance.new('BoxHandleAdornment', c)
                                        Box.Size = Box.Parent.Size
                                        Box.Transparency = Settings.Chams.Transparency
                                        Box.Adornee = Box.Parent
                                        Box.AlwaysOnTop = true
                                        Box.Visible = true
                                        Box.ZIndex = 2
                                        Box.Color3 = Settings.Chams.TeamBodyColor
                                        Box.Name = HttpService:GenerateGUID(false):lower():sub(1, 10);
                                    end
                                end
                            end
    
                            if Settings.Box.Enabled then
                                if c.Name == 'HumanoidRootPart' then
                                    local GUI = Instance.new('BillboardGui', c)
                                    local Frame = Instance.new('Frame', GUI)

                                    GUI.Adornee = c
                                    GUI.Size = UDim2.new(0.7, 0, 1, 0)
                                    GUI.StudsOffset = Vector3.new(-1.3, 2, 0)
                                    GUI.Parent = c
                                    GUI.AlwaysOnTop = true

                                    Frame.BackgroundTransparency = Settings.Box.Transparency
                                    Frame.ZIndex = 5
                                    Frame.Size = UDim2.new(5, 0, 5, 0)
                                    Frame.BackgroundColor3 = Settings.Box.TeamBoxColor
                                    Frame.BorderColor3 = Settings.Box.BoxOutlineColor
                                end
                            end


                            if Settings.Titles.Enabled then
                                if c.Name == 'Head' then
                                    if Settings.Titles.Name then
                                        local DistanceFromPlayer = (LocalPlayer.Character.PrimaryPart.Position - v.Character.PrimaryPart.Position).Magnitude
                                        local GUI = Instance.new('BillboardGui', c)
                                        local Label = Instance.new('TextLabel', GUI)
        
                                        GUI.Adornee = c
                                        GUI.Size = UDim2.new(12, 0, 1, 0)
                                        GUI.StudsOffset = Vector3.new(0, 2, 0)
                                        GUI.Parent = c
                                        GUI.AlwaysOnTop = true
        
                                        if Settings.Titles.Distance then
                                            Label.BackgroundTransparency = 1
                                            Label.ZIndex = 5
                                            Label.Size = UDim2.new(1, 0, 1, 0)
                                            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            Label.TextScaled = false
                                            Label.Text = v.Name..'\n['..round(DistanceFromPlayer)..'] Studs Away'
                                            Label.TextStrokeTransparency = 0
                                            Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                        else
                                            Label.BackgroundTransparency = 1
                                            Label.ZIndex = 5
                                            Label.Size = UDim2.new(1, 0, 1, 0)
                                            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            Label.TextScaled = false
                                            Label.Text = v.Name
                                            Label.TextStrokeTransparency = 0
                                            Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                         end
                                    end
                                end 
                            end
                        end
                    end
                end
            end
        end)
    else
        pcall(function()
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer then
                   for _,c in pairs(v.Character:GetDescendants()) do
                        if c:IsA('BillboardGui') or c:IsA('BoxHandleAdornment') then
                            c:Destroy()
                        end
                   end  
                end
            end
        end)
    end
end
