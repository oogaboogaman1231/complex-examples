-- Roblox Lua script demonstrating advanced GUI with tweening animations

-- Define the module
local GUIAnimations = {}

-- Function to animate GUI element position
function GUIAnimations.TweenPosition(guiElement, targetPosition, duration)
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local properties = {
        Position = targetPosition,
    }
    local tween = tweenService:Create(guiElement, tweenInfo, properties)
    tween:Play()
end

-- Function to animate GUI element size
function GUIAnimations.TweenSize(guiElement, targetSize, duration)
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local properties = {
        Size = targetSize,
    }
    local tween = tweenService:Create(guiElement, tweenInfo, properties)
    tween:Play()
end

-- Example usage:
local gui = Instance.new("Frame")
gui.Parent = game.Players.LocalPlayer.PlayerGui -- Replace with parent GUI object

-- Animate GUI position and size
GUIAnimations.TweenPosition(gui, UDim2.new(0.5, 0, 0.5, 0), 1.5)
GUIAnimations.TweenSize(gui, UDim2.new(0.8, 0, 0.8, 0), 1.5)

-- Return the module
return GUIAnimations
