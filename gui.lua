-- ANTI EZ TEAM GUI V2
local function createGUI()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AntiEzTeamGUI"
    ScreenGui.Parent = playerGui

    local MainFrame = Instance.new("TextLabel")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    MainFrame.Text = ""
    MainFrame.Parent = ScreenGui

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.4)
    TitleLabel.Text = "ANTIEZTEAM GUI V2"
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.TextScaled = true
    TitleLabel.Parent = MainFrame

    local ScriptBox = Instance.new("TextBox")
    ScriptBox.Name = "ScriptBox"
    ScriptBox.Size = UDim2.new(0.9, 0, 0, 100)
    ScriptBox.Position = UDim2.new(0.05, 0, 0.2, 0)
    ScriptBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    ScriptBox.TextColor3 = Color3.new(1, 1, 1)
    ScriptBox.PlaceholderText = "Enter your script"
    ScriptBox.Text = ""
    ScriptBox.TextScaled = true
    ScriptBox.Parent = MainFrame

    local FEButton = Instance.new("TextButton")
    FEButton.Name = "FEButton"
    FEButton.Size = UDim2.new(0.4, 0, 0, 40)
    FEButton.Position = UDim2.new(0.05, 0, 0.7, 0)
    FEButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
    FEButton.Text = "FE CADUCUS"
    FEButton.TextColor3 = Color3.new(1, 1, 1)
    FEButton.TextScaled = true
    FEButton.Parent = MainFrame

    local NaturalDisasterButton = Instance.new("TextButton")
    NaturalDisasterButton.Name = "NaturalDisasterButton"
    NaturalDisasterButton.Size = UDim2.new(0.4, 0, 0, 40)
    NaturalDisasterButton.Position = UDim2.new(0.55, 0, 0.7, 0)
    NaturalDisasterButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
    NaturalDisasterButton.Text = "natural disaster"
    NaturalDisasterButton.TextColor3 = Color3.new(1, 1, 1)
    NaturalDisasterButton.TextScaled = true
    NaturalDisasterButton.Parent = MainFrame

    local ScanButton = Instance.new("TextButton")
    ScanButton.Name = "ScanButton"
    ScanButton.Size = UDim2.new(0.4, 0, 0, 40)
    ScanButton.Position = UDim2.new(0.3, 0, 0.85, 0)
    ScanButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.8)
    ScanButton.Text = "SCAN REMOTES"
    ScanButton.TextColor3 = Color3.new(1, 1, 1)
    ScanButton.TextScaled = true
    ScanButton.Parent = MainFrame

    local function makeDraggable(gui)
        local dragging = false
        local dragInput, dragStart, startPos
        
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    makeDraggable(MainFrame)
    makeDraggable(TitleLabel)

    FEButton.MouseButton1Click:Connect(function()
        print("FE CADUCUS активирован!")
    end)

    NaturalDisasterButton.MouseButton1Click:Connect(function()
        print("natural disaster активирован!")
    end)

    ScanButton.MouseButton1Click:Connect(function()
        print("SCAN REMOTES активирован!")
    end)

    ScriptBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            print("Выполняем скрипт: " .. ScriptBox.Text)
        end
    end)

    print("ANTIEZTEAM GUI V2 загружено!")
end

createGUI()
