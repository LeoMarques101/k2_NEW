local shader = TalkAction("!shader")

function shader.onSay(player, words, param, type)

	if player:hasShader(7)then
		player:removeShader(7)
		player:say("Shader REMOVIDO!", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_STUN)
	else
		player:addShader(7)
		player:say("Shader ADICIONADO!", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_STUN)
	end

	return false
end

shader:register()