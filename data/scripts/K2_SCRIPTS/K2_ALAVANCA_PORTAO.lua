local ALAVANCA = {
    [1945] = {usada = 1946},
    [1946] = {usada = 1945},
    [9825] = {usada = 9826},
    [9826] = {usada = 9825},
    [9827] = {usada = 9828},
    [9828] = {usada = 9827},
}


local Portao ={
	[3100] = {id = 1498, move_direction = DIRECTION_SOUTH, positions = {
		{x=1015,y=658,z=7,stackpos=1},
		{x=1016,y=658,z=7,stackpos=1},
		{x=1017,y=658,z=7,stackpos=1},
		{x=1018,y=658,z=7,stackpos=1}
	}},
	[3101] = {id = 1498, move_direction = DIRECTION_SOUTH, positions = {
		{x=1090,y=694,z=7,stackpos=1},
		{x=1091,y=694,z=7,stackpos=1},
		{x=1092,y=694,z=7,stackpos=1},
		{x=1093,y=694,z=7,stackpos=1}
	}},
}



local K2_ALAVANCA_PORTAO = Action()

function K2_ALAVANCA_PORTAO.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(ALAVANCA[item.itemid].usada)

	for j,pos in ipairs(Portao[item.actionid].positions) do

		Portaopos = Position(pos)
		tilePortao = Tile(Portaopos)
		tileitens = tilePortao:getItems()
		tilecriaturas = tilePortao:getCreatures()

		if tilecriaturas ~= nil then
			for i,criatura in ipairs(tilecriaturas) do
				criatura:move(Portao[item.actionid].move_direction)
			end
		end

		if #tileitens > 0 then
			local count = 0
			for i,item_tile in ipairs(tileitens) do
				if item_tile:getId() == Portao[item.actionid].id then
					count = count + 1
				end
				item_tile:remove(item_tile:getCount())
			end
			if count == 0 then
			Game.createItem(Portao[item.actionid].id, 1, Portaopos)
			end
			Portaopos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			--return false
		else
			Game.createItem(Portao[item.actionid].id, 1, Portaopos)
			Portaopos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			--return false
		end

	end
	return true
end

K2_ALAVANCA_PORTAO:aid(3100)
K2_ALAVANCA_PORTAO:aid(3101)
K2_ALAVANCA_PORTAO:register()