
--use monsters name in low-case
local monstersToCount = {
    ["dragon"] = {storage = 1000, groupStorage = 5000},
    ["dragon lord"] = {storage = 1001, groupStorage = 5000},
    ["demon"] = {storage = 1002, groupStorage = 5001},
    ["warlock"] = {storage = 1003, groupStorage = 5002},
}

local k2kill = CreatureEvent("k2kill")

function k2kill.onKill(creature, target)
	creature:sendTextMessage(MESSAGE_EVENT_ORANGE, "You killed")
    if not Player(creature) then --check if killer is a Player
        return true
    end
    
    if not Monster(target) then --check if killed is a Monster
        return true
    end
    
    local monsterIndex = monstersToCount[string.lower(target:getName())] --get monster info from table using string.lower() to change target name to low-case
    if monsterIndex then --if exist monster info
        --update individual count
        local monsterKilledCount = creature:getStorageValue(monsterIndex.storage)
        if monsterKilledCount < 0 then--check if individual count is lower than 0 (default storage value = -1) and set to 0
            creature:setStorageValue(monsterIndex.storage, 0)
            monsterKilledCount = 0
        end
        creature:setStorageValue(monsterIndex.storage, monsterKilledCount + 1)
        
        --update group count
        local monsterGroupKilledCount = creature:getStorageValue(monsterIndex.groupStorage)
        if monsterGroupKilledCount < 0 then--check if group count is lower than 0 (default storage value = -1) and set to 0
            creature:setStorageValue(monsterIndex.groupStorage, 0)
            monsterGroupKilledCount = 0
        end
        creature:setStorageValue(monsterIndex.groupStorage, monsterGroupKilledCount + 1)
        
        creature:sendTextMessage(MESSAGE_EVENT_ORANGE, "You killed "..(monsterKilledCount + 1).." "..target:getName().." and "..(monsterGroupKilledCount + 1).." monsters of this group.")
    end
    return true
end

k2kill:register()