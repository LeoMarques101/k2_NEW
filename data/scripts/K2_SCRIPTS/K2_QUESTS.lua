questChests = {
   ---------------------------------------------------------
   -- Quest do Labirinto
   ---------------------------------------------------------
   [2000] = {
       minLevel = 0,
       storageUnique = 2000,
       items = {
           [1] = {type = "item", item = 2160, count = 10},
           [2] = {type = "experience", amount = 20000},
       },
   },
   
   ---------------------------------------------------------
   -- Example Quest Box 2 like anihi 2 reward only select 1
   ---------------------------------------------------------
   [2002] = {
       minLevel = 50,
       storageUnique = 2002, -- put same storage for only select 1 reward
       items = {
           [1] = {type = "item", item = 2160, count = 1},
           [2] = {type = "experience", amount = 20000},
           [3] = {type = "outfit", name = "assassin", femaleId = 156, maleId = 152},
           [4] = {type = "addon", outfit = "nobleman", addonNumber = 1, femaleId = 140, maleId = 132},
       },
   },
    [2003] = {
       minLevel = 50,
       storageUnique = 2002, -- put same storage for only select 1 reward
       items = {
           [1] = {type = "item", item = 2160, count = 1},
           [2] = {type = "experience", amount = 20000},
           [3] = {type = "outfit", name = "assassin", femaleId = 156, maleId = 152},
           [4] = {type = "addon", outfit = "nobleman", addonNumber = 1, femaleId = 140, maleId = 132},
       },
   }
}

function capAll(str)
    return (str:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end))
end

local advanceChest = Action()

function advanceChest.onUse(player, item, fromPosition, itemEx, toPosition)
   -----------------------------------------------------------------------------------
   -- Local Variables --
   -----------------------------------------------------------------------------------
   local questChest = item:getUniqueId()
   -----------------------------------------------------------------------------------
   -- Check if player has already opened box --
   -----------------------------------------------------------------------------------
   if player:getStorageValue(questChest) == 1 then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
       toPosition:sendMagicEffect(10)
       return true
   end
 
   local storageOne = questChests[questChest].storageUnique
   -----------------------------------------------------------------------------------
   -- Check if player has already opened box multiple chest only 1 reward --
   -----------------------------------------------------------------------------------
   if player:getStorageValue(storageOne) == 1 then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
       toPosition:sendMagicEffect(10)
       return true
   end 
 
   -----------------------------------------------------------------------------------
   -- Check if player meets level requirment
   -----------------------------------------------------------------------------------
   local playerLevel = player:getLevel()
   local minLevel = questChests[questChest].minLevel
   if questChests[questChest].minLevel >= playerLevel then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be level "..minLevel.." to open this chest.")
       return true
   end
   -----------------------------------------------------------------------------------
 
   -- Give rewward if player has not yet opened box --
 
   -----------------------------------------------------------------------------------
   for i = 1, #questChests[questChest].items do
       local rewardType = questChests[questChest].items[i].type
       -----------------------------------------------------------------------------------
       -- Item Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "item" then
           local item = questChests[questChest].items[i].item
           local count = questChests[questChest].items[i].count
           player:addItem(item, count)
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You earned ["..count.."x] "..capAll(getItemName(item)))
       end
       -----------------------------------------------------------------------------------
       -- Experience Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "experience" then
           local amount = questChests[questChest].items[i].amount
           player:addExperience(amount)
           player:say(amount.." EXP gained!", TALKTYPE_MONSTER_SAY)
           player:getPosition():sendMagicEffect(CONST_ME_STUN)
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained "..amount.." experience points.")
       end
       -----------------------------------------------------------------------------------
       -- Outfit Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "outfit" then
           local outfitName = questChests[questChest].items[i].name
           local maleOutfit = questChests[questChest].items[i].maleId
           local femaleOutfit = questChests[questChest].items[i].femaleId
           if player:getSex() == 0 then
               player:addOutfit(femaleOutfit)
           else
               player:addOutfit(maleOutfit)
           end
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the "..outfitName.." outfit.")
       end
       -----------------------------------------------------------------------------------
       -- Addon Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "addon" then
           local outfitName = questChests[questChest].items[i].outfit
           local addon = questChests[questChest].items[i].addonNumber
           local maleAddon = questChests[questChest].items[i].maleId
           local femaleAddon = questChests[questChest].items[i].femaleId
           if player:getSex() == 0 then
               player:addOutfitAddon(femaleAddon, addon)
           else
               player:addOutfitAddon(maleAddon, addon)
           end
           if addon == 1 then
               player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the first "..outfitName.." outfit addon.")
           elseif addon == 2 then
               player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the second "..outfitName.." outfit addon.")
           elseif addon == 3 then
               player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the third "..outfitName.." outfit addon.")
           end
       end

    end


   -----------------------------------------------------------------------------------
   -- Add in any cooldowns/storages --
   -----------------------------------------------------------------------------------
   player:setStorageValue(questChest, 1)
   player:setStorageValue(storageOne, 1)
   return true
end

for i = 2000, 2100 do
    advanceChest:uid(i)
end

advanceChest:register()