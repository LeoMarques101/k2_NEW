--[[
https://otland.net/threads/simple-auto-loot-system-tfs-1-3.273071/
https://github.com/otland/forgottenserver/compare/master...rookgaard:feature/autoloot

CREATE TABLE IF NOT EXISTS `player_autoloot` (
  `player_id` int(11) NOT NULL,
  `list` blob,
  UNIQUE KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

]]

--[[
Files to edit:
localizar: [K2_AUTOLOOT]
    scripts/eventcallbacks/default_onDropLoot.lua
    src/iologindata.cpp
    src/luascript.cpp
    src/luascript.h
    src/player.cpp
    src/player.h
]]

local autoloot_rope = Action()
function autoloot_rope.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (toPosition.x == CONTAINER_POSITION and not target:isContainer()) then
		local itemType = ItemType(target.itemid)

		if (player:getAutoLootItem(itemType:getId())) then
			player:removeAutoLootItem(itemType:getId())
			return player:sendTextMessage(MESSAGE_STATUS_WARNING, "Voce removeu " .. itemType:getName() .. ' de seu AutoLoot!')
		else
			player:addAutoLootItem(itemType:getId())
			return player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce adicionou " .. itemType:getName() .. ' para o seu AutoLoot!')
		end
	else
        return onUseRope(player, item, fromPosition, target, toPosition, isHotkey)
    end
end

autoloot_rope:id(8712)
autoloot_rope:register()

local info = {
    Money_ids = {2148, 2152, 2160}, -- id das moedas do ot
}


local k2_autoloot = TalkAction("!autoloot")
function k2_autoloot.onSay(player, words, param)


    local str = {
        "|=======| Commands |=======|\n",
        "!autoloot [add/remove], [itemID/name]\n",
        "!autoloot money\n",
        "!autoloot clear\n",
        "!autoloot \n",
    }


    if (param == '') then
        local list = player:getAutoLootList()

        if (not list) then
            player:sendTextMessage(MESSAGE_STATUS_WARNING,"Sua lista de AutoLoot esta vazia, use: !autoloot [itemID/name]")
            return false
        end

        local text = "|=======| Loot List |=======|\n!autoloot [itemID/name]\n"


        for _, itemID in ipairs(list) do
            local itemType = ItemType(itemID)
            text = text .."\n".._.." - ".. itemType:getName() .. ' [ID: ' .. itemID .. '] '
        end

        player:showTextDialog(7726, text)
        return false
        --return player:sendTextMessage(MESSAGE_INFO_DESCR, text:sub(1, -3) .. '.')
    end

    local itemType = ItemType(param)
    
    if (itemType:getId() == 0) then
        itemType = ItemType(tonumber(param))
    end

    if (itemType:getName() == '') then
        player:sendCancelMessage("Nao existe nenhum item com esse ID ou nome.")
        return false
    end


    if (player:addAutoLootItem(itemType:getId())) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce adicionou " .. itemType:getName() .. ' para o seu AutoLoot!')
        return false
    elseif (player:removeAutoLootItem(itemType:getId())) then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Voce removeu " .. itemType:getName() .. ' de seu AutoLoot!')
        return false
    end
    
    player:sendTextMessage(MESSAGE_STATUS_WARNING,"Parametro incorreto, use: !autoloot [itemID/name]")
    return false

end


local k2_autoloot_client = TalkAction("!autoloot_client")
function k2_autoloot_client.onSay(player, words, param)

    local itemType = ItemType("",param)
    
    if (itemType:getId() == 0) then
        itemType = ItemType(tonumber(param))
    end
    if (itemType:getName() == '') then
        player:sendCancelMessage("Nao existe nenhum item com esse ID ou nome.")
        return false
    end

    if (player:addAutoLootItem(itemType:getId())) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce adicionou " .. itemType:getName() .. ' para o seu AutoLoot!')
        return false
    elseif (player:removeAutoLootItem(itemType:getId())) then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Voce removeu " .. itemType:getName() .. ' de seu AutoLoot!')
        return false
    end
    
    player:sendTextMessage(MESSAGE_STATUS_WARNING,"Parametro incorreto, use: !autoloot [itemID/name]")
    return false
end


k2_autoloot_client:separator(" ")
k2_autoloot_client:register()

k2_autoloot:separator(" ")
k2_autoloot:register()