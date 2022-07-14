local ALAVANCA = {
    [1945] = {usada = 1946},
    [1946] = {usada = 1945},
    [9825] = {usada = 9826},
    [9826] = {usada = 9825},
    [9827] = {usada = 9828},
    [9828] = {usada = 9827},
}

local OUTFITS = {
	[1] = {name = "Citizen", female = 136, male = 128, custo = 0, items = {},
		addon1 = {custo = 2000, items = {}},
		addon2 = {custo = 2000, items = {}}
	},

	[2] = {name = "Hunter", female = 137 , male = 129, custo = 0, items = {},
		addon1 = {custo = 100000, items = {}},
		addon2 = {custo = 2000, items = {{id=5875, quant=1}}}
	},

	[3] = {name = "Mage", female = 141 , male = 130, custo = 0, items = {},
		addon1 = {custo = 2000, items = {}},
		addon2 = {custo = 100000, items = {{id=5903, quant=1}}}
	},

	[4] = {name = "Knight", female = 139 , male = 131, custo = 0, items = {},
		addon1 = {custo = 2000, items = {{id=2376, quant=1}}},
		addon2 = {custo = 10000, items = {}}
	},

	[5] = {name = "Noble", female = 140 , male = 132, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[6] = {name = "Summoner", female = 138 , male = 133, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[7] = {name = "Warrior", female = 142 , male = 134, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[8] = {name = "Barbarian", female = 147 , male = 143, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[9] = {name = "Druid", female = 148 , male = 144, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[10] = {name = "Wizard", female = 149 , male = 145, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[11] = {name = "Oriental", female = 150 , male = 146, custo = 0, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[12] = {name = "Pirate", female = 155 , male = 151, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[13] = {name = "Assassin", female = 156 , male = 152, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[14] = {name = "Beggar", female = 157 , male = 153, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[15] = {name = "Shaman", female = 158 , male = 154, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[16] = {name = "Norse", female = 252 , male = 251, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[17] = {name = "Nightmare", female = 269 , male = 268, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[18] = {name = "Jester", female = 270 , male = 273, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[19] = {name = "Brotherhood", female = 279 , male = 278, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[20] = {name = "Demon Hunter", female = 288 , male = 289, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[21] = {name = "Yalaharian", female = 324 , male = 325, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[22] = {name = "Warmaster", female = 336 , male = 335, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}}
	},

	[23] = {name = "Wayfarer", female = 366 , male = 367, custo = 10000, items = {},
		addon1 = {custo = 10000, items = {}},
		addon2 = {custo = 10000, items = {}},
	},

	[24] = {name = "Afflicted", female = 431 , male = 430, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[25] = {name = "Elementalist", female = 433 , male = 432, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[26] = {name = "Deepling", female = 464 , male = 463, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[27] = {name = "Insectoid", female = 466 , male = 465, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[28] = {name = "Entrepreneur", female = 471 , male = 472, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[29] = {name = "Crystal Warlord", female = 513 , male = 512, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[30] = {name = "Soil Guardian", female = 514 , male = 516, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[31] = {name = "Demon Outfit", female = 542 , male = 541, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[32] = {name = "Cave Explorer", female = 575 , male = 574, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[33] = {name = "Dream Warden", female = 578 , male = 577, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[34] = {name = "Glooth Engineer", female = 618 , male = 610, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[35] = {name = "Champion", female = 632 , male = 633, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[36] = {name = "Conjurer", female = 635 , male = 634, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[37] = {name = "Beastmaster", female = 636 , male = 637, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[38] = {name = "Chaos Acolyte", female = 664 , male = 665, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[39] = {name = "Death Herald", female = 666 , male = 667, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[40] = {name = "Ranger", female = 683 , male = 684, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[41] = {name = "Ceremonial Garb", female = 694 , male = 695, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[42] = {name = "Puppeteer", female = 696 , male = 697, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[43] = {name = "Spirit Caller", female = 698 , male = 699, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[44] = {name = "Evoker", female = 724 , male = 725, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[45] = {name = "Seaweaver", female = 732 , male = 733, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[46] = {name = "Recruiter", female = 745 , male = 746, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[47] = {name = "Sea Dog", female = 749 , male = 750, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[48] = {name = "Royal Pumpkin", female = 759 , male = 760, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[49] = {name = "Rift Warrior", female = 845 , male = 846, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[50] = {name = "Winter Warden", female = 852 , male = 853, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[51] = {name = "Philosopher", female = 874 , male = 873, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[52] = {name = "Arena Champion", female = 885 , male = 884, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},

	[53] = {name = "Lupine Warden", female = 900 , male = 899, custo = 10000, items = {},
	addon1 = {custo = 10000, items = {}},
	addon2 = {custo = 10000, items = {}},
	},
}

local MANEQUIN_POS = {
	[1]  = {x=1052, y=704, z=7},
	[2]  = {x=1055, y=704, z=7},
	[3]  = {x=1058, y=704, z=7},
	[4]  = {x=1061, y=704, z=7},
	[5]  = {x=1064, y=704, z=7},

	[6]  = {x=1052, y=707, z=7},
	[7]  = {x=1055, y=707, z=7},
	[8]  = {x=1058, y=707, z=7},
	[9]  = {x=1061, y=707, z=7},
	[10] = {x=1064, y=707, z=7},

	[11] = {x=1052, y=710, z=7},
	[12] = {x=1055, y=710, z=7},
	[13] = {x=1058, y=710, z=7},
	[14] = {x=1061, y=710, z=7},
	[15] = {x=1064, y=710, z=7},

	[16] = {x=1052, y=713, z=7},
	[17] = {x=1055, y=713, z=7},
	[18] = {x=1058, y=713, z=7},

	[19] = {x=1052, y=704, z=6},
	[20] = {x=1055, y=704, z=6},
	[21] = {x=1058, y=704, z=6},
	[22] = {x=1061, y=704, z=6},
	[23] = {x=1064, y=704, z=6},

	[24] = {x=1052, y=707, z=6},
	[25] = {x=1055, y=707, z=6},
	[26] = {x=1058, y=707, z=6},
	[27] = {x=1061, y=707, z=6},
	[28] = {x=1064, y=707, z=6},

	[29] = {x=1052, y=710, z=6},
	[30] = {x=1055, y=710, z=6},
	[31] = {x=1058, y=710, z=6},
	[32] = {x=1061, y=710, z=6},
	[33] = {x=1064, y=710, z=6},

	[34] = {x=1052, y=704, z=5},
	[35] = {x=1055, y=704, z=5},
	[36] = {x=1058, y=704, z=5},
	[37] = {x=1061, y=704, z=5},
	[38] = {x=1064, y=704, z=5},

	[39] = {x=1052, y=707, z=5},
	[40] = {x=1055, y=707, z=5},
	[41] = {x=1058, y=707, z=5},
	[42] = {x=1061, y=707, z=5},
	[43] = {x=1064, y=707, z=5},

	[44] = {x=1052, y=710, z=5},
	[45] = {x=1055, y=710, z=5},
	[46] = {x=1058, y=710, z=5},
	[47] = {x=1061, y=710, z=5},
	[48] = {x=1064, y=710, z=5},

	[49] = {x=1052, y=710, z=4},
	[50] = {x=1055, y=710, z=4},
	[51] = {x=1058, y=710, z=4},
	[52] = {x=1061, y=710, z=4},
	[53] = {x=1064, y=710, z=4},
}

local outfits_fromaid = 1700
local outfits_toaid = 1753


function giveOutfit(player, outfit)
	local outfit_looktype = player:getSex() == 0 and outfit.female or outfit.male
    local playermoney = player:getMoney()
    local playerhasoutfit = player:hasOutfit(outfit_looktype)

    local cont = 0
    local str = ""
    for i,item in ipairs(outfit.items) do

    	if player:getItemCount(item.id) < item.quant then
    		cont = cont + 1
    		str = str .. "voce nao tem " .. item.quant .. " " .. ItemType(item.id):getName() .. "\n"
    	end

    end

    if cont > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, str)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return true
    end

    	if outfit then
    		if playerhasoutfit then
    			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Voce ja tem esse outfit')
    			player:getPosition():sendMagicEffect(CONST_ME_POFF)
    			return true
    		else
		        if(outfit.custo > playermoney) then
		            player:sendTextMessage(MESSAGE_INFO_DESCR, 'Pobre')
		            player:getPosition():sendMagicEffect(CONST_ME_POFF)
		            return true
		        else
		        	player:addOutfit(outfit_looktype)
			        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'Comprou o outfit '.. outfit.name)
			        player:removeMoney(outfit.custo)

		            for i,item in ipairs(outfit.items) do
		            	player:removeItem(item.id, item.quant)
					end

			        return true
		        end
		    end 
    	end
	return true
end

function giveAddon(player, outfit, addonType)
	local addon
	if addonType == 1 then
		addon = outfit.addon1
	else
		addon = outfit.addon2
	end

	local outfit_looktype = player:getSex() == 0 and outfit.female or outfit.male


    local playermoney = player:getMoney()
    local playerhasoutfit = player:hasOutfit(outfit_looktype)
    local playerhasaddon = player:hasOutfit(outfit_looktype, addonType)

    local cont = 0
    local str = ""
    for i,item in ipairs(addon.items) do

    	if player:getItemCount(item.id) < item.quant then
    		cont = cont + 1
    		str = str .. "voce nao tem " .. item.quant .. " " .. ItemType(item.id):getName() .. "\n"
    	end

    end

    if cont > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, str)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return true
    end


    if outfit then

    		if not playerhasoutfit then

    			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Compre primeiro o outfit')
    			player:getPosition():sendMagicEffect(CONST_ME_POFF)
    			return true

    		end

    		if playerhasaddon then
    			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Voce ja tem esse addon')
    			player:getPosition():sendMagicEffect(CONST_ME_POFF)
    			return true
    		else
		        if(addon.custo > playermoney) then
		            player:sendTextMessage(MESSAGE_INFO_DESCR, 'Pobre')
		            player:getPosition():sendMagicEffect(CONST_ME_POFF)
		            return true
		        else
		        	player:addOutfitAddon(outfit_looktype, addonType)

			        player:sendTextMessage(MESSAGE_INFO_DESCR, 'Comprou o addon '.. addonType)
			        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

			        player:removeMoney(addon.custo)

		            for i,item in ipairs(addon.items) do
		            	player:removeItem(item.id, item.quant)
					end

			        return true
		        end
		    end
    	end
	return true
end

function outfitInfo(player, outfit)
	local str = ""

	if outfit then

		str = "==== " .. outfit.name .. " ===="
		str = str .. "\n\n------Outfit------"
		str = str .. "\nCusto: "..outfit.custo
		
		if #outfit.items > 0 then
			str = str .. "\nItens: "
			for i,item in ipairs(outfit.items) do
				str = str .. "\n" .. item.quant .. " " .. ItemType(item.id):getName()
			end
		end
		str = str .. "\n\n------Addon 1------"
		str = str .. "\nCusto: ".. outfit.addon1.custo

		if #outfit.addon1.items > 0 then
			str = str .. "\nItens: "
			for i,item in ipairs(outfit.addon1.items) do
				str = str .. "\n  " .. item.quant .. " " .. ItemType(item.id):getName()
			end
		end
		str = str .. "\n\n------Addon 2------"
		str = str .. "\nCusto: ".. outfit.addon2.custo
		if #outfit.addon2.items > 0 then
			str = str .. "\nItens: "
			for i,item in ipairs(outfit.addon2.items) do
				str = str .. "\n  " .. item.quant .. " " .. ItemType(item.id):getName()
			end
		end

	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'Nome incorreto')
		return false
	end
	player:showTextDialog(7726,str)
    return true
end

local k2_alavanca_outfits = Action()
function k2_alavanca_outfits.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(ALAVANCA[item.itemid].usada)

	local key = item.actionid - outfits_fromaid
	local WindowID = item.actionid
	local outfit = OUTFITS[key]

	player:registerEvent("ModalWindow_Outfit")
    local title = outfit.name
    local message = "Selecione o item que deseja adquirir:"
  
    local window = ModalWindow(WindowID, title, message)

	window:addButton(102, "Informacoes")
    window:addButton(100, "Selecionar")
    window:addButton(101, "Cancel")
	

	if outfit.custo > 0 then
    	window:addChoice(0, "Outfit")
	end
	window:addChoice(1, "Addon 1")
	window:addChoice(2, "Addon 2")
  
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
  
    window:sendToPlayer(player)
	return false


end

for aid = outfits_fromaid, outfits_toaid do
    k2_alavanca_outfits:aid(aid)
end
k2_alavanca_outfits:register()



--quando o player recebe a modal windows
local modal = CreatureEvent("ModalWindow_Outfit")
modal:type("modalwindow")
function modal.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("ModalWindow_Outfit")

    if modalWindowId >= outfits_fromaid and modalWindowId <= outfits_toaid  then
		local key = modalWindowId - outfits_fromaid
		local outfit = OUTFITS[key]

        if buttonId == 100 then
            
			if choiceId == 0 then
				giveOutfit(player,outfit)
			elseif choiceId == 1 then
				giveAddon(player,outfit,1)
			elseif choiceId == 2 then
				giveAddon(player,outfit,2)
			end

		elseif buttonId == 102 then
			outfitInfo(player, outfit)
        end
    end
end
modal:register()

--Criar e spawnar os manequins
local globalevent = GlobalEvent("MANEQUIN_SPAWN")
function globalevent.onStartup()

	-- Cria os manequins
	for i,outfit in pairs(OUTFITS) do

		local mType = Game.createMonsterType(outfit.name)
		local monster = {
			outfit = {lookType = outfit.male, lookHead = 0, lookBody = 0, lookLegs=95, lookFeet = 114, lookAddons = 3},
			flags = {attackable = false,hostile = false}
		}

		local intervalo = 0
		mType.onThink = function(monster, interval)
			intervalo = intervalo + 1

			if intervalo == 5 then
				intervalo = 0
				monster:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN) --CONST_ME_POFF
				if getCreatureOutfit(monster).lookType == outfit.male then
					monster:setOutfit({lookType = outfit.female, lookHead = 0, lookBody=math.random(77, 94), lookLegs=95, lookFeet = 114, lookAddons = 3})
				else
					monster:setOutfit({lookType = outfit.male, lookHead = 0, lookBody=math.random(77, 94), lookLegs=95, lookFeet = 114, lookAddons = 3})
				end  
			end
		end

		mType:register(monster)

		-- Spawna o Manequin
		Game.createMonster(outfit.name, MANEQUIN_POS[i], false, true)
	end
		
	return true
end
globalevent:register()