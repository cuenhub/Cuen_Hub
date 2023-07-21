-- Create a function to draw the player ESP
function PlayerESP.draw(player)
    if PlayerESP.visible then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character.HumanoidRootPart
            local camera = workspace.CurrentCamera

            -- Draw the box
            if PlayerESP.settings.box then
                local box = Drawing.new("Square")
                box.Visible = true
                box.Color = PlayerESP.settings.color
                box.Thickness = 1
                box.Transparency = 0.5
                box.Filled = false
                box.Position = Vector2.new(rootPart.Position.X, rootPart.Position.Z)
                box.Size = Vector2.new(50, 100)
                if PlayerESP.settings.box then
                    box.Filled = true
                end
                if PlayerESP.settings.outline then
                    local boxOutline = Drawing.new("Square")
                    boxOutline.Visible = true
                    boxOutline.Color = PlayerESP.settings.outlineColor
                    boxOutline.Thickness = 1
                    boxOutline.Transparency = 0.5
                    boxOutline.Filled = false
                    boxOutline.Position = Vector2.new(rootPart.Position.X, rootPart.Position.Z)
                    boxOutline.Size = Vector2.new(50, 100)
                end
            end

            -- Draw the name
            if PlayerESP.settings.name then
                local name = Drawing.new("Text")
                name.Visible = true
                name.Color = PlayerESP.settings.nameColor
                name.Size = PlayerESP.settings.textSize
                name.Center = true
                name.Outline = true
                name.OutlineColor = Color3.new(0, 0, 0)
                name.Text = player.Name
                name.Position = Vector2.new(rootPart.Position.X, rootPart.Position.Z - 50)
                if PlayerESP.settings.outline then
                    local nameOutline = Drawing.new("Text")
                    nameOutline.Visible = true
                    nameOutline.Color = PlayerESP.settings.outlineColor
                    nameOutline.Size = PlayerESP.settings.textSize
                    nameOutline.Center = true
                    nameOutline.Outline = true
                    nameOutline.OutlineColor = Color3.new(0, 0, 0)
                    nameOutline.Text = player.Name
                    nameOutline.Position = Vector2.new(rootPart.Position.X + 1, rootPart.Position.Z - 49)
                end
            end

            -- Draw the distance if the player is far enough away
            if PlayerESP.settings.distance and rootPart.Position ~= camera.CFrame.p then
                local distance = (rootPart.Position - camera.CFrame.p).Magnitude
                if distance > PlayerESP.settings.distanceThreshold then
                    local distanceText = Drawing.new("Text")
                    distanceText.Visible = true
                    distanceText.Color = PlayerESP.settings.distanceColor
                    distanceText.Size = PlayerESP.settings.textSize
                    distanceText.Center = true
                    distanceText.Outline = true
                    distanceText.OutlineColor = Color3.new(0, 0, 0)
                    distanceText.Text = string.format("%.1f", distance)
                    distanceText.Position = Vector2.new(rootPart.Position.X, rootPart.Position.Z - 70)
                    if PlayerESP.settings.outline then
                        local distanceOutline = Drawing.new("Text")
                        distanceOutline.Visible = true
                        distanceOutline.Color = PlayerESP.settings.outlineColor
                        distanceOutline.Size = PlayerESP.settings.textSize
                        distanceOutline.Center = true
                        distanceOutline.Outline = true
                        distanceOutline.OutlineColor = Color3.new(0, 0, 0)
                        distanceOutline.Text = string.format("%.1f", distance)
                        distanceOutline.Position = Vector2.new(rootPart.Position.X + 1, rootPart.Position.Z - 69)
                    end
                end
            end

            -- Draw the tracer
            if PlayerESP.settings.tracer then
                local ray = Ray.new(camera.CFrame.p, (rootPart.Position - camera.CFrame.p).Unit * 1000)
                local part, position = workspace:FindPartOnRay(ray, player.Character)
                if part and part:IsDescendantOf(player.Character) then
                    local tracer = Drawing.new("Line")
                    tracer.Visible = true
                    tracer.Color = PlayerESP.settings.tracerColor
                    tracer.Thickness = PlayerESP.settings.tracerThickness
                    tracer.Transparency = 0.5
                    tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                    tracer.To = camera:WorldToViewportPoint(position)
                    if PlayerESP.settings.outline then
                        local tracerOutline = Drawing.new("Line")
                        tracerOutline.Visible = true
                        tracerOutline.Color =PlayerESP.settings.outlineColor
                        tracerOutline.Thickness = PlayerESP.settings.tracerThickness
                        tracerOutline.Transparency = 0.5
                        tracerOutline.From = Vector2.new(camera.ViewportSize.X / 2 + 1, camera.ViewportSize.Y / 2 + 1)
                        tracerOutline.To = camera:WorldToViewportPoint(position)
                    end
                end
            end
        end
    end
end
