local ec = EventCallback

ec.onDropLoot = function(self, corpse)
	if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
		return
	end

	local player = Player(corpse:getCorpseOwner())
	local mType = self:getType()
	if not player or player:getStamina() > 840 then
		local monsterLoot = mType:getLoot()
		for i = 1, #monsterLoot do
			local item = corpse:createLootItem(monsterLoot[i])
			if not item then
				print('[Warning] DropLoot:', 'Could not add loot item to corpse.')
			end
		end

		if player then
			--[K2_AUTOLOOT]
			local items = corpse:getItems()
			local autolootContainer = Game.createItem(1987, 1)

			for _, item in ipairs(items) do
				if (player:getAutoLootItem(item.itemid)) then
					item:moveTo(autolootContainer)
				end
			end
			--[K2_AUTOLOOT]
			local text = ("Loot of %s: %s"):format(mType:getNameDescription(), corpse:getContentDescription())
			--[K2_AUTOLOOT]
			if (autolootContainer:getSize() > 0) then
				text = text .. '. [Autoloot]: ' .. autolootContainer:getContentDescription()
				local autolootItems = autolootContainer:getItems()

				for _, item in ipairs(autolootItems) do

					player:addItem(item:getId(),item:getCount())
					item:remove(item:getCount())

					--item:moveTo(player)
				end
				autolootContainer:remove(1)
			end
			text = text .. '.'
			--[K2_AUTOLOOT]

			local party = player:getParty()
			if party then
				party:broadcastPartyLoot(text)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, text)
			end
		end
	else
		local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
		local party = player:getParty()
		if party then
			party:broadcastPartyLoot(text)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, text)
		end
	end
end

ec:register()
