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

local function InBearForm()
    local _, _, isActive, _ = GetShapeshiftFormInfo(1);
    return isActive
end

local function InCatForm()
    local _, _, isActive, _ = GetShapeshiftFormInfo(3);
    return isActive
end

local function EquipMeleeWeapons()
    UseItemByName(idolOfBrutality)
end

local function EquipSpellDmgWeapons()
    UseItemByName(idolOfTheMoon)
end

function RetroNosha:HandleWeapons(casterGuid, targetGuid, castType, spellId, spellName,
        spellRank, castDuration)

    if(InBearForm() or InCatForm()) then
        return
    end

    if (druidForms[spellName]) then
        EquipMeleeWeapons()
        return
    end

    EquipSpellDmgWeapons()
end