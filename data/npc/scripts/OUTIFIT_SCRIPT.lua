local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) 

	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
--function onThink() npcHandler:onThink() end


local NPCS = {
	["Cityzen"] = {female = 136 , male = 128},
	["Hunter"] = {female = 137 , male = 129},
	["Mage"] = {female = 141 , male = 130},
	["Knight"] = {female = 139 , male = 131},
	["Noble"] = {female = 140 , male = 132},
	["Summoner"] = {female = 138 , male = 133},
	["Warrior"] = {female = 142 , male = 134},
	["Barbarian"] = {female = 147 , male = 143},
	["Druid"] = {female = 148 , male = 144},
	["Wizard"] = {female = 149 , male = 145},
	["Oriental"] = {female = 150 , male = 146},
	["Pirate"] = {female = 155 , male = 151},
	["Assassin"] = {female = 156 , male = 152},
	["Beggar"] = {female = 157 , male = 153},
	["Shaman"] = {female = 158 , male = 154},
	["Norse"] = {female = 252 , male = 251},
	["Nightmare"] = {female = 269 , male = 268},
	["Jester"] = {female = 270 , male = 273},
	["Brotherhood"] = {female = 279 , male = 278},
	["DemonHunter"] = {female = 288 , male = 289},
	["Yalaharian"] = {female = 324 , male = 325},
	["Warmaster"] = {female = 336 , male = 335},
	["Wayfarer"] = {female = 366 , male = 367}
}


function onThink(interval)
local npc = Npc()
local tipo = NPCS[npc:getName()]
if time == nil then time = 0	end

		if time < 3 then

			time = time + 1
			return false
		else

			time = 0

		end


        if isCreature(npc) then
        	
        	math.randomseed(os.time())
        	--math.random(0, 132)
        	npc:say("!outfit "..npc:getName(), TALKTYPE_MONSTER_SAY, false, nil, npc:getPosition())
        	npc:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN) --CONST_ME_POFF
        	--Game.sendAnimatedText("!outfit "..npc:getName(),npc:getPosition(), 30)
        	npc:setOutfit({lookType = (getCreatureOutfit(npc).lookType == tipo.female and tipo.male or tipo.female ), lookHead = 0, lookBody=math.random(77, 94), lookLegs=95, lookFeet = 114, lookAddons = 3})
        	--npc:setOutfit({lookType = (getCreatureOutfit(npc).lookType == tipo.female and tipo.male or tipo.female ), lookHead = math.random(0, 132), lookBody=math.random(0, 132), lookLegs=math.random(0, 132), lookFeet = math.random(0, 132), lookAddons = 3})
        
        end

	npcHandler:onThink()
end
