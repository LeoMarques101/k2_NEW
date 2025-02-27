local staminaTries = 1 --# on minutes
local skillTries = 7 --# tries by blow
local manaSpent = function() return math.random(425, 575) end --# mana consumed by blow
local slotForUse = CONST_SLOT_AMMO
local istranning = 37

local dummies = {
    [5777] = { skillRate = 1, skillSpeed = 1 },
    [5787] = { skillRate = 1, skillSpeed = 1 }
}

local weapons = {
    [26385] = { shootEffect = CONST_ME_SMALLCLOUDS, shootDistEffect = CONST_ANI_DEATH, skillType = SKILL_MAGLEVEL }, -- magicLevel
    [26386] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_HUNTINGSPEAR, skillType = SKILL_DISTANCE }, -- distance
    [26383] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
    [26382] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe
    [26384] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB } -- club
}


local k2tranning_login = CreatureEvent("k2tranning_login")
local k2tranning_logout = CreatureEvent("k2tranning_logout")

function k2tranning_login.onLogin(player)
    --print("login")
    player:setStorageValue(istranning,0)
    return true
end

function k2tranning_logout.onLogout(player)
    --print("logout")
    player:setStorageValue(istranning,0)
    return true
end

k2tranning_login:register()
k2tranning_logout:register()


local function start_train(pid,start_pos,itemid,fpos,dummy)
    local player = Player(pid)

    if player ~= nil then
        local pos_n = player:getPosition()
        local exercise = player:getSlotItem(slotForUse)

        if exercise then
            if exercise.itemid ~= itemid then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce terminou seu treinamento.")
                player:setStorageValue(istranning,0)
                return true
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce terminou seu treinamento.")
            player:setStorageValue(istranning,0)
            return true
        end
        if start_pos:getDistance(pos_n) == 0 then

                    if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
                        local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)

                        if charges_n >= 1 then
                            exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES, (charges_n-1))

                            local required = 0
                            local currently = 0
                            local voc = player:getVocation()

                            if weapons[itemid].skillType == SKILL_MAGLEVEL then

                                --#### TREINO DE MAGIC
                                player:addManaSpent((manaSpent() * dummy.skillRate) * configManager.getNumber(configKeys.RATE_MAGIC))

                            else
                                --#### TREINO DE SKILL
                                player:addSkillTries(weapons[itemid].skillType, (skillTries * dummy.skillRate) * configManager.getNumber(configKeys.RATE_SKILL))
                            end


                            if weapons[itemid].shootDistEffect then
                                pos_n:sendDistanceEffect(fpos, weapons[itemid].shootDistEffect)
                            end

                            fpos:sendMagicEffect(weapons[itemid].shootEffect)

                            player:setStamina(player:getStamina() + 60)

                            if charges_n == 1 then
                                exercise:remove(1)
                                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sua arma de exercicio expirou, portanto seu treinamento tambem.")
                                player:setStorageValue(istranning,0)
                                return true
                            end
                            local training = addEvent(start_train, voc:getAttackSpeed() * dummy.skillSpeed, pid,start_pos,itemid,fpos,dummy)
                        else
                            exercise:remove(1)
                            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sua arma de exercicio expirou, portanto seu treinamento tambem.")
                            --stopEvent(training)
                            player:setStorageValue(istranning,0)
                            return true
                        end
                    end


        else
            --stopEvent(training)
            --return player:sendCancelMessage("Voce so pode treinar na zona de protecao.")
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce terminou seu treinamento.")
            player:setStorageValue(istranning,0)
            return true
        end
    else
        --stopEvent(training)
        --player:setStorageValue(istranning,0)
        return true
    end
    return true

end


local weapon = Action()

function weapon.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getStorageValue(istranning) == 0 then
        local start_pos = player:getPosition()

        if target:isItem() then
            if dummies[target:getId()] then

                local ammo = player:getSlotItem(slotForUse)
                if ammo then
                    if ammo.uid ~= item.uid then
                        return player:sendCancelMessage("A arma deve estar localizada em sua slot de municao.")
                    end
                end

                if not getTilePzInfo(player:getPosition()) then
                    return player:sendCancelMessage("Voce so pode treinar na zona de protecao.")
                end

                if not weapons[item.itemid].shootDistEffect and (start_pos:getDistance(target:getPosition()) > 1) then
                    return false
                end
                local dummy = dummies[target.itemid]

                player:setStorageValue(istranning,1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce comecou a treinar.")
                start_train(player:getId(),start_pos,item.itemid,target:getPosition(),dummy)
            end
        end

    else
        player:sendCancelMessage("Voce ja esta treinando.")
    end

    return true

end

weapon:allowFarUse(true)
weapon:id(26382,26383,26384,26385,26386)
weapon:register()