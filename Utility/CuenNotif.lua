-- creds to Sw1ndlerScripts for the notification !
function createBaseNotifications()
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationHolder") then
        return game:GetService("Players").LocalPlayer.PlayerGui.NotificationHolder
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local ToggleNotif = Instance.new("Frame")
    ToggleNotif.Name = "ToggleNotif"
    ToggleNotif.ZIndex = 5
    ToggleNotif.AnchorPoint = Vector2.new(1, 1)
    ToggleNotif.Visible = false
    ToggleNotif.Size = UDim2.new(0, 291, 0, 56)
    ToggleNotif.Position = UDim2.new(1, 0, 1, 0)
    ToggleNotif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ToggleNotif.Parent = ScreenGui
    
    local UiCorner = Instance.new("UICorner")
    UiCorner.Name = "UiCorner"
    UiCorner.Parent = ToggleNotif
    
    local Dropshadow = Instance.new("UIStroke")
    Dropshadow.Name = "Dropshadow"
    Dropshadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Dropshadow.Transparency = 0.8
    Dropshadow.Thickness = 2
    Dropshadow.Color = Color3.fromRGB(20, 20, 20)
    Dropshadow.Parent = ToggleNotif
    
    local SepVertical = Instance.new("Frame")
    SepVertical.Name = "SepVertical"
    SepVertical.Size = UDim2.new(0, 2, 0, 56)
    SepVertical.BackgroundTransparency = 0.5
    SepVertical.Position = UDim2.new(0.7423077, 0, 0, 0)
    SepVertical.BorderSizePixel = 0
    SepVertical.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    SepVertical.Parent = ToggleNotif
    
    local SepHorizontal = Instance.new("Frame")
    SepHorizontal.Name = "SepHorizontal"
    SepHorizontal.Size = UDim2.new(0, 72, 0, 2)
    SepHorizontal.BackgroundTransparency = 0.5
    SepHorizontal.Position = UDim2.new(0.75, 0, 0.4464286, 2)
    SepHorizontal.BorderSizePixel = 0
    SepHorizontal.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
    SepHorizontal.Parent = ToggleNotif
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 216, 0, 19)
    Title.BackgroundTransparency = 1
    Title.BorderSizePixel = 0
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.FontSize = Enum.FontSize.Size14
    Title.TextSize = 14
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSans
    Title.Parent = ToggleNotif
    Title.TextXAlignment = Enum.TextXAlignment.Left

    
    local Paragraph = Instance.new("TextLabel")
    Paragraph.Name = "Paragraph"
    Paragraph.Size = UDim2.new(0, 218, 0, 37)
    Paragraph.BackgroundTransparency = 1
    Paragraph.Position = UDim2.new(0, 0, 0.3392857, 0)
    Paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph.FontSize = Enum.FontSize.Size14
    Paragraph.TextSize = 14
    Paragraph.TextColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph.Text = ""
    Paragraph.TextYAlignment = Enum.TextYAlignment.Top
    Paragraph.TextWrapped = true
    Paragraph.Font = Enum.Font.SourceSans
    Paragraph.TextWrap = true
    Paragraph.TextXAlignment = Enum.TextXAlignment.Left
    Paragraph.Parent = ToggleNotif
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingRight = UDim.new(0, 5)
    UIPadding.Parent = Paragraph
    
    local True = Instance.new("TextButton")
    True.Name = "True"
    True.Size = UDim2.new(0, 72, 0, 27)
    True.BackgroundTransparency = 1
    True.Position = UDim2.new(0.75, 0, 0, 0)
    True.BorderSizePixel = 0
    True.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    True.FontSize = Enum.FontSize.Size14
    True.TextSize = 14
    True.TextColor3 = Color3.fromRGB(255, 255, 255)
    True.Text = "Yes"
    True.Font = Enum.Font.SourceSans
    True.Parent = ToggleNotif
    
    local False = Instance.new("TextButton")
    False.Name = "False"
    False.Size = UDim2.new(0, 72, 0, 27)
    False.BackgroundTransparency = 1
    False.Position = UDim2.new(0.75, 0, 0.5178571, 0)
    False.BorderSizePixel = 0
    False.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    False.FontSize = Enum.FontSize.Size14
    False.TextSize = 14
    False.TextColor3 = Color3.fromRGB(255, 255, 255)
    False.Text = "No"
    False.Font = Enum.Font.SourceSans
    False.Parent = ToggleNotif
    
    local LocalScript = Instance.new("LocalScript")
    LocalScript.Parent = ScreenGui
    
    local DefaultNotif = Instance.new("Frame")
    DefaultNotif.Name = "DefaultNotif"
    DefaultNotif.ZIndex = 5
    DefaultNotif.AnchorPoint = Vector2.new(1, 1)
    DefaultNotif.Visible = false
    DefaultNotif.Size = UDim2.new(0, 291, 0, 56)
    DefaultNotif.Position = UDim2.new(1, 0, 0.9999999, 0)
    DefaultNotif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    DefaultNotif.Parent = ScreenGui
    
    local UiCorner1 = Instance.new("UICorner")
    UiCorner1.Name = "UiCorner"
    UiCorner1.Parent = DefaultNotif
    
    local Dropshadow1 = Instance.new("UIStroke")
    Dropshadow1.Name = "Dropshadow"
    Dropshadow1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Dropshadow1.Transparency = 0.8
    Dropshadow1.Thickness = 2
    Dropshadow1.Color = Color3.fromRGB(20, 20, 20)
    Dropshadow1.Parent = DefaultNotif
    
    local Title1 = Instance.new("TextLabel")
    Title1.Name = "Title"
    Title1.Size = UDim2.new(0, 291, 0, 19)
    Title1.BackgroundTransparency = 1
    Title1.BorderSizePixel = 0
    Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title1.FontSize = Enum.FontSize.Size14
    Title1.TextSize = 14
    Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title1.Font = Enum.Font.SourceSans
    Title1.Parent = DefaultNotif
    Title1.TextXAlignment = Enum.TextXAlignment.Left
    
    local Paragraph1 = Instance.new("TextLabel")
    Paragraph1.Name = "Paragraph"
    Paragraph1.Size = UDim2.new(0, 291, 0, 37)
    Paragraph1.BackgroundTransparency = 1
    Paragraph1.Position = UDim2.new(0, 0, 0.3392857, 0)
    Paragraph1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph1.FontSize = Enum.FontSize.Size14
    Paragraph1.TextSize = 14
    Paragraph1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph1.Text = ""
    Paragraph1.TextYAlignment = Enum.TextYAlignment.Top
    Paragraph1.TextWrapped = true
    Paragraph1.Font = Enum.Font.SourceSans
    Paragraph1.TextWrap = true
    Paragraph1.TextXAlignment = Enum.TextXAlignment.Left
    Paragraph1.Parent = DefaultNotif
    
    local UIPadding1 = Instance.new("UIPadding")
    UIPadding1.PaddingLeft = UDim.new(0, 10)
    UIPadding1.PaddingRight = UDim.new(0, 5)
    UIPadding1.Parent = Paragraph1
    
    if syn then
        syn.protect_gui(ScreenGui)
    end
    
    ScreenGui.Parent = game.CoreGui
    return ScreenGui
end

local notificationLibrary = {}

notificationHolder = createBaseNotifications()

notifAmount = 0
removedPos = nil

function notificationLibrary:CreatePromptNotif(args)
	args = args or {}
	
	
	args.TweenSpeed = args.TweenSpeed or 1
	args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
	args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
	args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
	
	args.Title = args.Title or "Title"
	args.Text = args.Text or "Text"
	
	args.TrueText = args.TrueText or "Yes"
	args.FalseText = args.FalseText or "No"
	
	args.Duration = args.Duration or 5
	args.Callback = args.Callback or function() warn("No callback for notif") end
	
	---- arg defining ^
	

	
	notifAmount = notifAmount + 1
	
	local track = notifAmount
	local notifNum = notifAmount
	
	local doesExist = true
	local notif = notificationHolder.ToggleNotif:Clone()
	local removed = false
	
	notif.Parent = notificationHolder
	notif.Visible = true
	notif.Position = UDim2.new(1, 300, 1, -5)
	
	notif.Transparency = 0.05
	
	notif.True.Text = args.TrueText
	notif.False.Text = args.FalseText
	
	task.spawn(function()
		task.wait(args.Duration + args.TweenInSpeed)
		doesExist = false
	end)
	
	notif.True.MouseButton1Click:Connect(function()
		doesExist = false
		removed = true
		notifAmount = notifAmount - 1
		removedPos = notif.Position.Y.Offset	

		pcall(args.Callback, true)
	end)
	
	
	notif.False.MouseButton1Click:Connect(function()
		doesExist = false
		removed = true
		notifAmount = notifAmount - 1
		removedPos = notif.Position.Y.Offset	
		
		pcall(args.Callback, false)
	end)
	
	notif.Paragraph.Text = args.Text
	notif.Title.Text = args.Title

	notif:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
	
	task.spawn(function()
		local originalPos = notif.Position
		while doesExist and task.wait() do	
			local pos = notif.Position
			
			if notifAmount > track then
				notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				track = track + 1
			end
			
			if notifAmount < track then
				if removedPos > pos.Y.Offset then
					notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				else
					notifNum = notifNum - 1
				end
				track = track - 1
			end
		end
		
		local pos = notif.Position
		
		if removed == false then
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
		
		notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
		task.wait(args.TweenOutSpeed)
		notif:Destroy()
	end)
end

function notificationLibrary:CreateDefaultNotif(args)
	args = args or {}
	
	
	args.TweenSpeed = args.TweenSpeed or 1
	args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
	args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
	args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
	
	args.Title = args.Title or "Title"
	args.Text = args.Text or "Text"
	
	args.Duration = args.Duration or 5
	
	---- arg defining ^
	
    
	
	notifAmount = notifAmount + 1
	
	local track = notifAmount
	local notifNum = notifAmount
	
	local removed = false
	local doesExist = true
	local notif = notificationHolder.DefaultNotif:Clone()

	notif.Parent = notificationHolder
	notif.Visible = true
	notif.Position = UDim2.new(1, 300, 1, -5)
	
    notif.Transparency = 0.05
	
	notif.InputBegan:Connect(function(InputObject)
        if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
    		task.spawn(function()
    			local tweenInfo = TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0, false,0)
    			game:GetService("TweenService"):Create(notif, tweenInfo, {Transparency = 0.8}):Play()
    		end)
            doesExist = false
		    removed = true
		    notifAmount = notifAmount - 1
		    removedPos = notif.Position.Y.Offset
        end
    end)
	
	task.spawn(function()
		task.wait(args.Duration + args.TweenInSpeed)
		doesExist = false
	end)
	
	notif.Paragraph.Text = args.Text
	notif.Title.Text = args.Title

	notif:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
	
	task.spawn(function()
		local originalPos = notif.Position
		while doesExist and task.wait() do	
			local pos = notif.Position
			
			if notifAmount > track then
				notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				track = track + 1
			end
			
			if notifAmount < track then
				if removedPos > pos.Y.Offset then
					notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				else
					notifNum = notifNum - 1
				end
				track = track - 1
			end
		end
		
		local pos = notif.Position
		
		if removed == false then 
    	    notifAmount = notifAmount - 1
    		removedPos = notif.Position.Y.Offset
    	end
		
		
		notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
		task.wait(args.TweenOutSpeed)
		notif:Destroy()
	end)
end


return notificationLibrary
