---@diagnostic disable: undefined-field
WeaponManager = {}
WeaponManager.__index = WeaponManager

function WeaponManager:New()
    local weaponManager = {}

    setmetatable(weaponManager, self)
    return weaponManager
end

local function HandleRetroWowWeapons(playerName, casterGuid, targetGuid, castType, spellId, spellName,
        spellRank, castDuration)

    if(string.AreEqualIgnoreCase(playerName, "Noshu")) then
        NoshuWeapons.RetroNoshu:HandleWeapons(casterGuid, targetGuid, castType, spellId,
            spellName, spellRank, castDuration)
        return
    end

    if(string.AreEqualIgnoreCase(playerName, "Nosha")) then
        NoshuWeapons.RetroNosha:HandleWeapons(casterGuid, targetGuid, castType, spellId,
            spellName, spellRank, castDuration)
        return
    end
end

function WeaponManager:HandleWeapons(casterGuid, targetGuid, castType, spellId, castDuration)

    local exists, playerGuid = UnitExists("player")
     if(exists and not string.AreEqualIgnoreCase(playerGuid, casterGuid)) then
        return
    end

    --PrintUnitCastEvent(casterGuid, targetGuid, castType, spellId, castDuration)

    local realmName = GetRealmName()
    local playerName = UnitName("player")
    local spellName, spellRank = SpellInfo(spellId)

    if(string.AreEqualIgnoreCase(realmName, "RetroWoW")) then
        HandleRetroWowWeapons(playerName, casterGuid, targetGuid, castType, spellId, spellName, spellRank,
            castDuration)
        return
    end
end

function PrintUnitCastEvent(casterGUID, targetGUID, castType, spellId, castDuration)
  DEFAULT_CHAT_FRAME:AddMessage( 
" - casterGUID: " .. casterGUID .. 
" - targetGUID: " .. targetGUID .. 
" - CastType: " .. castType .. 
" - SpellId: " .. spellId .. 
" - castDuration: " .. castDuration)
end