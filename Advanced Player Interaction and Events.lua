-- Roblox Lua script demonstrating advanced player interaction and events

-- Define the module
local PlayerInteraction = {}

-- Function to handle player interaction with objects
function PlayerInteraction.Interact(player, object)
    -- Example: Check if player can interact with the object
    if object.CanInteract then
        -- Example: Trigger interaction event on the object
        object:Fire("Interacted", player)
        print(player.Name .. " interacted with " .. object.Name)
    else
        print("Cannot interact with " .. object.Name)
    end
end

-- Example usage:
local player = game.Players.LocalPlayer -- Replace with actual player object
local object = workspace.InteractiveObject -- Replace with actual interactive object in the game

PlayerInteraction.Interact(player, object)

-- Return the module
return PlayerInteraction
