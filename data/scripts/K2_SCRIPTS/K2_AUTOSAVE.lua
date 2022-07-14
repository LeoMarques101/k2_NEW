local autoSave = GlobalEvent("autoSave")
local cleanMapAtSave = true

local function serverSave(interval)
    if cleanMapAtSave then
        cleanMap()
    end

    saveServer()
    Game.broadcastMessage('Server save complete. Next save in ' .. math.floor(interval / 60000) .. ' minutes!', MESSAGE_STATUS_WARNING)
end

function autoSave.onThink(interval)
    Game.broadcastMessage('Server save in 60 seconds. You might lag or freeze for 3 seconds.', MESSAGE_STATUS_WARNING)
    addEvent(serverSave, 60000, interval)
    return true
end

autoSave:interval(1800000)
autoSave:register()