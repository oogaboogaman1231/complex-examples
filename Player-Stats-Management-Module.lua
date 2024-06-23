-- Roblox Lua script for managing player stats using get_genv()

-- Define the module
local PlayerStats = {}

-- Persistent storage in Roblox's global environment
local genv = getgenv()
if not genv.PlayerStatsData then
    genv.PlayerStatsData = {}  -- Initialize if not exists
end

-- Function to initialize player data
local function initPlayerData(player)
    local playerId = player.UserId
    if not genv.PlayerStatsData[playerId] then
        genv.PlayerStatsData[playerId] = {
            Money = 0,
            Experience = 0,
            Level = 1,
            Inventory = {},
            -- Add more stats as needed
        }
    end
end

-- Function to save player data
local function savePlayerData(player)
    local playerId = player.UserId
    -- Example: Save data to datastore or global storage
    -- Here, we just print for demonstration
    print("Saving data for player " .. playerId .. ":")
    print(genv.PlayerStatsData[playerId])
end

-- Function to load player data
local function loadPlayerData(player)
    local playerId = player.UserId
    -- Example: Load data from datastore or global storage
    -- Here, we simulate loading data
    print("Loading data for player " .. playerId .. ":")
    print(genv.PlayerStatsData[playerId])
end

-- Function to increment player's experience
function PlayerStats.AddExperience(player, amount)
    initPlayerData(player)
    genv.PlayerStatsData[player.UserId].Experience = genv.PlayerStatsData[player.UserId].Experience + amount
    savePlayerData(player)
end

-- Function to give money to a player
function PlayerStats.GiveMoney(player, amount)
    initPlayerData(player)
    genv.PlayerStatsData[player.UserId].Money = genv.PlayerStatsData[player.UserId].Money + amount
    savePlayerData(player)
end

-- Function to get player's money
function PlayerStats.GetMoney(player)
    initPlayerData(player)
    return genv.PlayerStatsData[player.UserId].Money
end

-- Example usage:
local player = game.Players.LocalPlayer -- Replace with actual player object
PlayerStats.AddExperience(player, 100)
PlayerStats.GiveMoney(player, 500)

print("Player's money:", PlayerStats.GetMoney(player))

-- Return the module
return PlayerStats
