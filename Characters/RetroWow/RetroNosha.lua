---@diagnostic disable: undefined-field
RetroNosha = {}
RetroNosha.__index = RetroNosha

function RetroNosha:New()
    local retroNosha = {}

    setmetatable(retroNosha, self)
    return retroNosha
end

local idolOfTheMoon = "Idol of the Moon"
local idolOfBrutality = "Idol of Brutality"

local druidForms = {
    ["Dire Bear Form"] = true,
    ["Cat Form"] = true,
    ["Bear Form"] = true
}

local function EquipMeleeWeapons()
    UseItemByName(idolOfBrutality)
end

local function EquipSpellDmgWeapons()
    UseItemByName(idolOfTheMoon)
end

local function InBearForm()
    local _, _, active, _ = GetShapeshiftFormInfo(1);
    return active
end

local function InCatForm()
    local _, _, active, _ = GetShapeshiftFormInfo(3);
    return active
end

local function ShouldIgnoreWeaponSwap(spellName, castType)
    if(InBearForm()) then
        return true
    end

    if(InCatForm()) then
        return true
    end

    if(string.AreEqualIgnoreCase(castType, "MAINHAND")) then
        return true
    end

    if(string.AreEqualIgnoreCase(spellName, "Nature's Swiftness")) then
        return true;
    end

    if(string.AreEqualIgnoreCase(spellName, "War Stomp")) then
        return true;
    end

    return false
end

function RetroNosha:HandleWeapons(casterGuid, targetGuid, castType, spellId, spellName,
        spellRank, castDuration)

    if (druidForms[spellName]) then
        EquipMeleeWeapons()
        return
    end

    if(ShouldIgnoreWeaponSwap(spellName, castType)) then
        return
    end

    EquipSpellDmgWeapons()
end