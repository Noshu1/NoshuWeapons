NoshuWeapons = {}

function NoshuWeapons:Init()
    NoshuWeapons:InitManagers()
    NoshuWeapons:InitCharacters()

    print("NoshuWeapons Loaded")
end

function NoshuWeapons:InitManagers()
    self.WeaponManager = WeaponManager:New()
end

function NoshuWeapons:InitCharacters()
    NoshuWeapons:InitRetroWowCharacters()
end

function NoshuWeapons:InitRetroWowCharacters()
    self.RetroNoshu = RetroNoshu:New()
end


NoshuWeapons:Init()