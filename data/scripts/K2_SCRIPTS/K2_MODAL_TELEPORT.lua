local tps = {
    [1] = {desc = "Sala de itens", pos = {x=694, y=332, z=7}},
    [2] = {desc = "teste", pos = {x=729, y=474, z=7}},
}


local god_tp = TalkAction("/tp")

function god_tp.onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

    player:registerEvent("ModalWindow_Tutorial")
  
    local title = "GOD TP"
    local message = "Selecione o destino que deseja"
  
    local window = ModalWindow(1000, title, message)

    window:addButton(100, "Teleport")
    window:addButton(101, "Cancel")

    for key,value in pairs(tps) do
        window:addChoice(key, value.desc)
    end
  
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
  
    window:sendToPlayer(player)
	return false
end

god_tp:separator(" ")
god_tp:register()


local modal = CreatureEvent("ModalWindow_Tutorial")
modal:type("modalwindow")
function modal.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("ModalWindow_Tutorial")
  
    if modalWindowId == 1000 then
        if buttonId == 100 then
            player:teleportTo(tps[choiceId].pos)
        end
    end
end
modal:register()



