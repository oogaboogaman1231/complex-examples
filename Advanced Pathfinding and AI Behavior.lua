-- Roblox Lua script demonstrating advanced pathfinding and AI behavior

-- Define the module
local AIController = {}

-- Function to control AI movement using pathfinding
function AIController.MoveToTarget(aiModel, targetPosition)
    local pathfindingService = game:GetService("PathfindingService")
    local agent = pathfindingService:CreatePath()
    agent:ComputeAsync(aiModel.PrimaryPart.Position, targetPosition)
    
    agent.PathStatusChanged:Connect(function(status)
        if status == Enum.PathStatus.Complete then
            for _, waypoint in ipairs(agent:GetWaypoints()) do
                -- Example: Move AI model to each waypoint
                aiModel:SetPrimaryPartCFrame(waypoint.Position)
                wait(1) -- Example delay between waypoints
            end
        end
    end)
    
    agent:MoveTo(targetPosition)
end

-- Example usage:
local aiModel = game.Workspace.AIModel -- Replace with actual AI model in the game
local targetPosition = Vector3.new(10, 0, 10) -- Replace with actual target position

AIController.MoveToTarget(aiModel, targetPosition)

-- Return the module
return AIController
