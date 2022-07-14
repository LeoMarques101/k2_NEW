local config = {
    interval = 2000,
    texts = {
        { pos = Position(1007, 718, 7), text = "Depots!", effects = { CONST_ME_TELEPORT, CONST_ME_DRAWBLOOD } },
        { pos = Position(1035, 718, 7), text = "Teleports!", effects = { CONST_ME_ICEAREA, CONST_ME_ENERGYHIT } },
        { pos = Position(1026, 723, 7), text = "Shopping de Alavancas", effects = { CONST_ME_ENERGYAREA, CONST_ME_FERUMBRAS } }
    }
}

local textOnMap = GlobalEvent("TextOnMap")

function textOnMap.onThink(interval)
    local player = Game.getPlayers()[1]
    if not player then
        return true
    end

    for k, info in pairs(config.texts) do
        --player:say(info.text, TALKTYPE_MONSTER_SAY, false, nil, info.pos)
        Game.sendAnimatedText(info.text, info.pos, TEXTCOLOR_YELLOW)
        --info.pos:sendMagicEffect(info.effects[math.random(1, #info.effects)])
    end
    return true
end

textOnMap:interval(config.interval)
textOnMap:register()