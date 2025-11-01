---@diagnostic disable: undefined-field
RetroNoshu = {}
RetroNoshu.__index = RetroNoshu

local thunderfury = "Thunderfury, Blessed Blade of the Windseeker"
local elementiumReinforcedBulwark = "Elementium Reinforced Bulwark"
local hammerOfTheTwistingNether = "Hammer of the Twisting Nether"

local healingSpells = {
    ["Flash of Light"] = true,
    ["Holy Light"] = true
}

function RetroNoshu:New()
    local retroNoshu = {}

    setmetatable(retroNoshu, self)
    return retroNoshu
end

local function ShouldEquipMeleeWeapons(castType, spellName)
    if(not string.AreEqualIgnoreCase(castType, "CAST")) then
        return false
    end

    if (healingSpells[spellName]) then
        return false
    end

    return true
end

local function ShouldEquipHealingWeapons(castType, spellName, castDuration)
    if(not string.AreEqualIgnoreCase(castType, "START")) then
        return false
    end

    if(castDuration < 1400) then
        return false
    end

    if (not healingSpells[spellName]) then
        return false
    end

    return true
end

local function EquipHealingWeapons()
    UseItemByName(hammerOfTheTwistingNether)
    UseItemByName(elementiumReinforcedBulwark)
end

local function EquipMeleeWeapons()
    UseItemByName(thunderfury)
    UseItemByName(elementiumReinforcedBulwark)
end

function RetroNoshu:HandleWeapons(casterGuid, targetGuid, castType, spellId, spellName,
        spellRank, castDuration)

    if(ShouldEquipMeleeWeapons(castType, spellName)) then
        EquipMeleeWeapons()
        return
    end

    if(ShouldEquipHealingWeapons(castType, spellName, castDuration)) then
        EquipHealingWeapons()
        return
    end
end