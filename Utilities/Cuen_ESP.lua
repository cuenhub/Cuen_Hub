local Config = {
    Box               = false,
    BoxOutline        = false,
    BoxColor          = Color3.fromRGB(255,255,255),
    BoxOutlineColor   = Color3.fromRGB(0,0,0),
    HealthBar         = false,
    HealthBarSide     = "Left", -- Left,Bottom,Right
    Names             = false,
    NamesOutline      = false,
    NamesColor        = Color3.fromRGB(255,255,255),
    NamesOutlineColor = Color3.fromRGB(0,0,0),
    NamesFont         = 2, -- 0,1,2,3
    NamesSize         = 13,
    Chams             = false,
    ChamsColor        = Color3.fromRGB(255, 255, 255),
}

function CreateEsp(Player)
    local Box, BoxOutline, Name, HealthBar, HealthBarOutline, ChamsHighlight = Drawing.new("Square"), Drawing.new("Square"), Drawing.new("Text"), Drawing.new("Square"), Drawing.new("Square"), Instance.new("Highlight")
    


    local function UpdateEsp()
        if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Head") then
            local Target2dPosition, IsVisible = workspace.CurrentCamera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(40 * scale_factor), math.floor(60 * scale_factor)

            if Config.Chams then
                ChamsHighlight.Parent = Player.Character
                ChamsHighlight.OutlineTransparency = 1
           end
            
            if Config.Box then
                Box.Visible = IsVisible
                Box.Color = Config.BoxColor
                Box.Size = Vector2.new(width, height)
                Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)
                Box.Thickness = 1
                Box.ZIndex = 69
                
                if Config.BoxOutline then
                    BoxOutline.Visible = IsVisible
                    BoxOutline.Color = Config.BoxOutlineColor
                    BoxOutline.Size = Vector2.new(width, height)
                    BoxOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)
                    BoxOutline.Thickness = 3
                    BoxOutline.ZIndex = 1
                else
                    BoxOutline.Visible = false
                end
            else
                Box.Visible = false
                BoxOutline.Visible = false
            end
            
            if Config.Names then
                Name.Visible = IsVisible
                Name.Color = Config.NamesColor
                Name.Text = Player.Name.." "..math.floor((workspace.CurrentCamera.CFrame.p - Player.Character.HumanoidRootPart.Position).magnitude).."m"
                Name.Center = true
                Name.Outline = Config.NamesOutline
                Name.OutlineColor = Config.NamesOutlineColor
                Name.Position = Vector2.new(Target2dPosition.X,Target2dPosition.Y - height * 0.5 + -15)
                Name.Font = Config.NamesFont
                Name.Size = Config.NamesSize
            else
                Name.Visible = false
            end
            
            if Config.HealthBar then
                HealthBarOutline.Visible = IsVisible
                HealthBarOutline.Color = Color3.fromRGB(0,0,0)
                HealthBarOutline.Filled = true
                HealthBarOutline.ZIndex = 1
    
                HealthBar.Visible = IsVisible
                HealthBar.Color = Color3.fromRGB(255,0,0):lerp(Color3.fromRGB(0,255,0), Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth)
                HealthBar.Thickness = 1
                HealthBar.Filled = true
                HealthBar.ZIndex = 69
                
                if Config.HealthBarSide == "Left" then
                    HealthBarOutline.Size = Vector2.new(2, height)
                    HealthBarOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2) + Vector2.new(-3, 0)
                    
                    HealthBar.Size = Vector2.new(1, -(HealthBarOutline.Size.Y - 2) * (Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth))
                    HealthBar.Position = HealthBarOutline.Position + Vector2.new(1,-1 + HealthBarOutline.Size.Y)
                elseif Config.HealthBarSide == "Bottom" then
                    HealthBarOutline.Size = Vector2.new(width, 3)
                    HealthBarOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y + Box.Size.Y / 2) + Vector2.new(0, 3)
                    
                    HealthBar.Size = Vector2.new((HealthBarOutline.Size.X - 2) * (Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth), 1)
                    HealthBar.Position = HealthBarOutline.Position + Vector2.new(1, -1)
                elseif Config.HealthBarSide == "Right" then
                    HealthBarOutline.Size = Vector2.new(2, height)
                    HealthBarOutline.Position = Vector2.new(Target2dPosition.X + Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2) + Vector2.new(3, 0)
                    
                    HealthBar.Size = Vector2.new(1, -(HealthBarOutline.Size.Y - 2) * (Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth))
                    HealthBar.Position = HealthBarOutline.Position + Vector2.new(-1, -1 + HealthBarOutline.Size.Y)
                end
            else
                HealthBar.Visible = false
                HealthBarOutline.Visible = false
            end
            
            if Config.Chams then
                ChamsHighlight.OutlineTransparency = 0
                ChamsHighlight.OutlineColor3 = Config.ChamsColor
            else
            ChamsHighlight.OutlineTransparency = 1
            end
        else
            Box.Visible = false
            BoxOutline.Visible = false
            Name.Visible = false
            HealthBar.Visible = false
            HealthBarOutline.Visible = false
            ChamsHighlight.OutlineTransparency = 1
        end
    end

    Player.CharacterAdded:Connect(UpdateEsp)  -- Call the UpdateEsp function directly
    
    if Player.Character then
        UpdateEsp()  -- Call the UpdateEsp function immediately
    end
end

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v ~= game:GetService("Players").LocalPlayer then
        CreateEsp(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    if v ~= game:GetService("Players").LocalPlayer then
        CreateEsp(v)
    end
end)

return Config