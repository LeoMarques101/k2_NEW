function getAllMonster()
	local str = ""
	local monster = io.open("data/monster/monsters.xml", "r")
	str = "Você digitou incorretamente o nome do monstro veja a lista de monstro\n"

	for i in monster:read("*a"):gmatch('<monster name="(.-)"') do
		str = ""..str.." - "..i..""
	end

	return str
end

function getAttrMonster(name)
	return "Vida = "..getMonsterInfo(name).health.."\nExp = "..getMonsterInfo(name).experience.."\n"
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local CREATURE_talk = TalkAction("!creature")
function CREATURE_talk.onSay(player, words, param)
	local creature = MonsterType(param)
	local creatureloot = creature:getLoot()

	if param == "" or not param or param == " " then
		doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa dizer o nome do monstro")
		return false
	end

	if not creature then
		doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "Nome Incorreto")
		return false
	end
	local itens_str = ""
	local dumpp = ""
	for i,item in ipairs(creatureloot) do
		local itemType = ItemType(item.itemId)

		itens_str = itens_str .. "\n(" .. item.itemId .. ") " .. itemType:getName() .. ": " .. item.chance/1000 .. "%"

		for k,childLoot in ipairs(item.childLoot) do
			local itemType_child = ItemType(childLoot.itemId)
			itens_str = itens_str .. "\n  (" .. childLoot.itemId .. ") " .. itemType_child:getName() .. ": " .. childLoot.chance/1000 .. "%"
		end
	end


	--doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE,"teste"..str)
	local str = "======== Info Monster ========"

	str = str .."\n\nName: ".. creature:name()
	str = str .."\nHp: ".. creature:maxHealth()
	str = str .."\nXp base: ".. creature:experience()
	str = str .."\n\n=========== Loot ==========="
	str = str ..itens_str

	player:showTextDialog(7726,str)
	return true
	--[[
	local name = param
		if creature then
			doShowTextDialog(player, 1397, "Info Monster "..name.."\n".. creature:getMaxHealth() .."\nAttacks = "..getMonsterAttacks(name).."\n\nDefense = "..getMonsterDefense(name).."\n\nVoices = "..getMonsterVoices(name).."\n\nLoots = "..getMonsterLootItens(name).."")
		else
			doShowTextDialog(player, 1397, getAllMonster())
		return true
	end
	return false
	]]
end

CREATURE_talk:separator(" ")
CREATURE_talk:register()
