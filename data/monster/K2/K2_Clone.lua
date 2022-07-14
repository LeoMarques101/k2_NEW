local mType = Game.createMonsterType("K2 Clone")
local monster = {}

monster.description = "K2 Clone"
monster.experience = 0
monster.health = 1
monster.maxHealth = monster.health
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 450
monster.maxSummons = 0
monster.canWalkOnEnergy = false;
monster.canWalkOnFire = true;
monster.canWalkOnPoison = false;


monster.outfit = {
	lookType = 152,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 132,
	lookFeet = 132,
	lookAddons = 3,
	lookShader = 7
}

monster.changeTarget = {
	interval = 2*1000,
	chance = 5
}

monster.flags = {
	hidehealth = true,
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	targetDistance = 1,
	staticAttackChance = 70,
	isboss = true,
	lightlevel = 100,
	lightcolor = 33,
}

monster.attacks = {
	{name = "melee", attack = 200, skill = 100, interval = 300},
	{name = "combat",type = COMBAT_PHYSICALDAMAGE, range = 7, chance = 10, interval = 1*1000, minDamage = -150, maxDamage = -200, target = true,  shootEffect = CONST_ANI_REDSTAR},
	{name = "drunk", chance = 10, interval = 1*1000,duration = 5*1000, minDamage = 0, maxDamage = -120, target = true, range = 7, effect = CONST_ME_GREEN_RINGS, shootEffect = CONST_ANI_GREENSTAR}
}

monster.defenses = {
	defense = 60,
	armor = 55,
	{name = "invisible", type = COMBAT_HEALING, duration = 2*1000 ,chance = 15, interval = 1*1000, effect = CONST_ME_MAGIC_BLUE},
	{name = "speed", chance = 15, interval = 2*1000, speed = 320, effect = CONST_ME_MAGIC_RED},
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2*1000, minDamage = 180, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_DEATHDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE, percent = -10}
}

monster.immunities = {
	{type = "fire", combat = true, condition = true},
	{type = "drown", condition = true},
	{type = "lifedrain", combat = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true}
}

mType:register(monster)
