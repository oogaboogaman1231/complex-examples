-- Roblox Lua script for managing player inventory and items

-- Define the module
local InventorySystem = {}

-- Persistent storage in Roblox's global environment
local genv = getgenv()
if not genv.PlayerInventoryData then
    genv.PlayerInventoryData = {}
end

-- Function to initialize player inventory
local function initPlayerInventory(player)
    local playerId = player.UserId
    if not genv.PlayerInventoryData[playerId] then
        genv.PlayerInventoryData[playerId] = {
            Items = {},
            MaxSlots = 10,  -- Example maximum inventory slots
        }
    end
end

-- Function to save player inventory data
local function savePlayerInventory(player)
    local playerId = player.UserId
    -- Example: Save data to datastore or global storage
    -- Here, we just print for demonstration
    print("Saving inventory for player " .. playerId .. ":")
    print(genv.PlayerInventoryData[playerId])
end

-- Function to load player inventory data
local function loadPlayerInventory(player)
    local playerId = player.UserId
    -- Example: Load data from datastore or global storage
    -- Here, we simulate loading data
    print("Loading inventory for player " .. playerId .. ":")
    print(genv.PlayerInventoryData[playerId])
end

-- Function to add an item to player's inventory
function InventorySystem.AddItem(player, itemId)
    initPlayerInventory(player)
    local inventory = genv.PlayerInventoryData[player.UserId]
    
    if #inventory.Items >= inventory.MaxSlots then
        print("Inventory full. Cannot add item.")
        return false
    end
    
    table.insert(inventory.Items, itemId)
    savePlayerInventory(player)
    return true
end

-- Function to remove an item from player's inventory
function InventorySystem.RemoveItem(player, itemId)
    initPlayerInventory(player)
    local inventory = genv.PlayerInventoryData[player.UserId]
    
    for i, item in ipairs(inventory.Items) do
        if item == itemId then
            table.remove(inventory.Items, i)
            savePlayerInventory(player)
            return true
        end
    end
    
    print("Item not found in inventory.")
    return false
end

-- Function to get player's inventory
function InventorySystem.GetInventory(player)
    initPlayerInventory(player)
    return genv.PlayerInventoryData[player.UserId].Items
end

-- Example usage:
local player = game.Players.LocalPlayer -- Replace with actual player object
InventorySystem.AddItem(player, "sword")
InventorySystem.AddItem(player, "potion")
print("Player's inventory:", table.concat(InventorySystem.GetInventory(player), ", "))

InventorySystem.RemoveItem(player, "sword")
print("Player's inventory after removing 'sword':", table.concat(InventorySystem.GetInventory(player), ", "))

-- Return the module
return InventorySystem
