local FileName = "wz_autofarm_settings.lua" --The name of our file that will be in our exploits workspace folder

if not pcall(function() readfile(FileName) end) then
    local DefaultSettings = { --This is the table that has the default settings
    CustomD = false,
    Mission = "Crabby Crusade",
    Redo = false,
    Equip = false,
    Sell = false,
    UpgradeLimit = 1,
    Common = false,
    Uncommon = false,
    Rare = false,
    Epic = false,
    }
    writefile(FileName, game:service'HttpService':JSONEncode(DefaultSettings)) 
end

local JSON = game:service'HttpService':JSONDecode(readfile(FileName)) 

function Save()
    writefile(FileName, game:service'HttpService':JSONEncode(JSON))
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/hoangsalty/Scripts/master/Lib%20UI.lua", true))()
local window = library:CreateWindow("World//Zero AutoFarm")

window:AddToggle({text = "Custom Dungeon", state = JSON.CustomD, callback = function(a) 
    JSON.CustomD = a
    Save()
end})

window:AddList({text = "Mission", value = JSON.Mission, 
    values = {
        "Crabby Crusade",
        "Dire Problem",
        "Scarecrow Defense",
        "Kingslayer",
        "Night of the Dead",
        "Gravetower",
        "Temple of Ruin",
        "Mama Trauma",
        "Volcano's Shadow",
        "Volcano Dungeon",
        "Mountain Pass",
        "Winter Cavern",
        "Winter Dungeon",
        "Scarp Canyon",
        "Deserted Burrowmine",
        "The Pyramid",
        "Prison Tower",
    }, callback = function(mission) 
        JSON.Mission = mission
        Save()
end})

window:AddToggle({text = "Redo", state = JSON.Redo, callback = function(a) 
    JSON.Redo = a
    Save()
end})

window:AddToggle({text = "Auto Equip", state = JSON.Equip, callback = function(a) 
    JSON.Equip = a
    Save()
end})

local sell = window:AddFolder("Auto Sell")

sell:AddToggle({text = "Enable", state = JSON.Sell, callback = function(a) 
    JSON.Sell = a
    Save()
end})

sell:AddBox({text = "Upgrade Limit", value = JSON.UpgradeLimit, callback = function(a) 
    JSON.UpgradeLimit = a
    Save()
end})

sell:AddToggle({text = "Common", state = JSON.Common, callback = function(a) 
    JSON.Common = a
    Save()
end})

sell:AddToggle({text = "Uncommon", state = JSON.Uncommon, callback = function(a) 
    JSON.Uncommon = a
    Save()
end})

sell:AddToggle({text = "Rare", state = JSON.Rare, callback = function(a) 
    JSON.Rare = a
    Save()
end})

sell:AddToggle({text = "Epic", state = JSON.Epic, callback = function(a) 
    JSON.Epic = a
    Save()
end})

repeat wait() until game.Players.LocalPlayer
while not game:IsLoaded() do game.Loaded:wait() end

function WaitForChild(Parent, ChildName)
    if Parent:FindFirstChild(ChildName) then
        return Parent[ChildName]
    else
        repeat game:GetService("RunService").Heartbeat:wait() until Parent:FindFirstChild(ChildName) or not Parent.Parent
        return Parent:FindFirstChild(ChildName)
    end
end

local Player = game.Players.LocalPlayer
local Character, Collider, Profile
local Update
Update = function()
    if Player.Character == nil then repeat game:GetService("RunService").Heartbeat:wait() until Player.Character ~= nil and Player.Character.Parent end
    Character = Player.Character
    Collider = WaitForChild(Character, "Collider")
    Profile = WaitForChild(game.ReplicatedStorage.Profiles, Player.Name)
    if Collider and Profile then
        return Character, Collider, Profile
    else
        return Update(game:GetService("RunService").Heartbeat:wait())
    end
end

spawn(function()
    while wait(1800) do
        game:GetService("TeleportService"):Teleport(2727067538, Player)
    end
end)

function worlds()
    for i,v in next, Player.PlayerGui.MainGui.ObjectiveList:GetChildren() do
        if v:IsA("TextLabel") and v.Text:lower():find("world 5") then
            return 31
        elseif v:IsA("TextLabel") and v.Text:lower():find("world 4") then
            return 29
        elseif v:IsA("TextLabel") and v.Text:lower():find("world 3") then
            return 20
        elseif v:IsA("TextLabel") and v.Text:lower():find("world 2") then
            return 19
        elseif v:IsA("TextLabel") and v.Text:lower():find("world 1") then
            return 13
        end
    end
end

function missions(name)
    if name == "Crabby Crusade" then
        return 1
    elseif name == "Dire Problem" then
        return 2
    elseif name == "Scarecrow Defense" then
        return 3
    elseif name == "Kingslayer" then
        return 4
    elseif name == "Night of the Dead" then
        return 5
    elseif name == "Gravetower Dungeon" then
        return 6
    elseif name == "Temple of Ruin" then
        return 11
    elseif name == "Mama Trauma" then
        return 12
    elseif name == "Volcano's Shadow" then
        return 13
    elseif name == "Volcano Dungeon" then
        return 7
    elseif name == "Mountain Pass" then
        return 14
    elseif name == "Winter Cavern" then
        return 15
    elseif name == "Winter Dungeon" then
        return 16
    elseif name == "Scarp Canyon" then
        return 20
    elseif name == "Deserted Burrowmine" then
        return 19
    elseif name == "The Pyramid" then
        return 18
    elseif name == "Prison Tower" then
        return 21
    end
end

function farmLevel()
    Update()
    local pLevel = Profile.Level.Value
    if pLevel >= 1 and pLevel < 4 then
        return 1 -- Crabby Crusade
    elseif pLevel >= 4 and pLevel < 7 then
        return 3 -- Scarecrow Defense
    elseif pLevel >= 7 and pLevel < 10 then
        return 2 -- Dire Problem
    elseif pLevel >= 10 and pLevel < 12 then
        return 4 -- Kingslayer
    elseif pLevel >= 12 and pLevel < 15 then
        return 6 -- Gravetower Dungeon
    elseif pLevel >= 15 and pLevel < 18 then
        return 11 -- Temple of Ruin
    elseif pLevel >= 18 and pLevel < 22 then
        return 12 -- Mama Trauma
    elseif pLevel >= 22 and pLevel < 26 then
        return 13 -- Volcano's Shadow
    elseif pLevel >= 26 and pLevel < 30 then
        return 7 -- Volcano Dungeon
    elseif pLevel >= 30 and pLevel < 35 then
        return 14 -- Mountain Pass
    elseif pLevel >= 35 and pLevel < 40 then
        return 15 -- Winter Cavern
    elseif pLevel >= 40 and pLevel < 45 then
        return 16 -- Winter Dungeon
    elseif pLevel >= 45 and pLevel < 50 then
        return 20 -- Scarp Canyon
    elseif pLevel >= 50 and pLevel < 55 then
        return 19 -- Deserted Burrowmine
    elseif pLevel >= 55 and pLevel < 60 then
        return 18 -- The Pyramid
    elseif pLevel >= 60 then
        return 21 -- Prison Tower
    end
end

function questFinish(mission)
    for i,v in next, require(game.ReplicatedStorage.Shared.Quests.QuestList) do
        if v.Name == mission then
            return v.Objective[2], true
        end
    end
end

function questProgress(ID)
    return require(game.ReplicatedStorage.Shared.Quests):GetQuestProgress(Player, ID)
end

function autoMissions()
    Update()
    local pLevel = Profile.Level.Value
    for i,v in next, require(game.ReplicatedStorage.Shared.Quests.QuestList) do
        if v.WorldQuest and v.WorldQuest == true and questProgress(i) ~= questFinish(v.Name) and not v.Name:find("teleporter") then
            if v.Name == "Defeat crabs around the beach" then
                return 1
            elseif (v.Name == "Defeat 10 Boarwolves" or v.Name == "Defeat Elite Boarwolves") and pLevel >= 7 then
                return 2
            elseif v.Name == "Defeat 10 Snakes" and pLevel >= 4 then
                return 3
            elseif v.Name == "Defeat Green Goblins in World 2" and pLevel >= 15 then
                return 11
            elseif v.Name == "Defeat quillodiles" and pLevel >= 18 then
                return 12
            elseif v.Name == "Defeat red goblins in World 2" and pLevel >= 22 then
                return 13
            elseif (v.Name == "Defeat Icy Goos" or v.Name == "Defeat Snow Raptors in World 3" or v.Name == "Defeat Frost Golems in World 3") and pLevel >= 40 then
                return 16
            elseif v.Name == "Defeat Dark Scorpions in World 4" and pLevel >= 50 then
                return 20
            elseif (v.Name == "Defeat Green Scarabs in World 4" or v.Name == "Defeat Happy Cactus enemies in World 4") and pLevel >= 55 then
                return 18
            end
        end
    end
    return farmLevel()
end

function Farm()
    local get = debug.getupvalues
    if not get then 
        warn("Gay")
        return
    end

    function getmob()
        local closestTarget = nil
        local closestDistance = math.huge
        for i,v in next, workspace.Mobs:GetChildren() do
            if v:IsA("Model") and not v.Name:lower():find("boss") and v.Name ~= "MagmaGigaBlob" and v.Name ~= "FireCastleCommander" and v:FindFirstChild("HealthProperties") and v:FindFirstChild("Collider") and v.HealthProperties.Health.Value > 0 then
                Update()
                local currentDistance = (Collider.Position - v.Collider.Position).magnitude
                if currentDistance < closestDistance then
                    closestDistance = currentDistance
                    closestTarget = v
                end
            end
        end
        return closestTarget
    end
    
    function getboss()
        for i,v in next, workspace.Mobs:GetChildren() do
            if v:IsA("Model") and v.Parent and (v.Name:lower():find("boss") or v.Name == "MagmaGigaBlob" or v.Name == "FireCastleCommander") and not v:FindFirstChild("NoHealthbar") and v:FindFirstChild("Collider") and v:FindFirstChild("FromSpawnPart") and v:FindFirstChild("HealthProperties") and v:FindFirstChild("MobProperties") and v.MobProperties:FindFirstChild("Busy") and not v.MobProperties.Busy:FindFirstChild("Before") and v.HealthProperties.Health.Value > 0 then
                if v.HealthProperties.Health.Value > 0 and tostring(v.FromSpawnPart.Value) ~= "CliffsideMama" and tostring(v.FromSpawnPart.Value) ~= "BridgeMama" and tostring(v.FromSpawnPart.Value) ~= "DireCaveSpawn" and tostring(v.FromSpawnPart.Value) ~= "DireBridgeSpawn" or v.FromSpawnPart.Value == nil then
                    return v
                end
            end
        end
    end
    
    function getobject()
        for i,v in next, workspace:GetDescendants() do
            if v:IsA("Model") and not v:FindFirstChild("Meshes/PillerStone5") and not v.Name:lower():find("scarecrow") and not v.Name:lower():find("fountain") and v.PrimaryPart ~= nil and not v:FindFirstChild("Collider") and v:FindFirstChild("HealthProperties") and v.HealthProperties.Health.Value > 0 then
                return v
            end
        end
    end

    function changeTarget()
        for i,v in next, workspace:GetChildren() do
            if (v.Name:lower():find("pillar") or v.Name:lower():find("gate")) and v:FindFirstChild("HealthProperties") and v.HealthProperties.Health.Value > 0 then
                return true
            end
        end
    end

    function trigger()
        if workspace:FindFirstChild("MissionObjects") then
            for i,v in next, workspace.MissionObjects:GetDescendants() do
                if v.Name == "Cutscenes" or v.Name == "WaterKillPart" or v.Name == "CliffsideFallTriggers" then 
                    v:Remove()
                elseif v:IsA("Part") and tostring(v.Parent) ~= "Geyser" and v.Name ~= "Teleporter" and not v.Name:lower():find("hearttele") and not v.Name:lower():find("a0") and not v.Name:lower():find("e0") and not v.Name:lower():find("s0") and not v.Name:lower():find("reset") and not v.Name:lower():find("push") and not v.Name:lower():find("temple") and not v.Name:lower():find("mushroom") and not v.Name:lower():find("water") and not v.Name:lower():find("lava") and not v.Name:lower():find("damage") and not v.Name:lower():find("fall") and v:FindFirstChildWhichIsA("TouchTransmitter") then
                    Update()
                    firetouchinterest(Collider, v, 0)
                    firetouchinterest(Collider, v, 1)
                    game:GetService("RunService").Heartbeat:wait()
                end
            end
            for i,v in next, workspace:GetChildren() do
                if (v.Name:lower():find("cage") or v.Name:lower():find("treasure")) and v:FindFirstChild("Collider") and v.Collider:FindFirstChildWhichIsA("TouchTransmitter") then
                    Update()
                    firetouchinterest(Collider, v.Collider, 0)
                    firetouchinterest(Collider, v.Collider, 1)
                    game:GetService("RunService").Heartbeat:wait()
                end
            end
            if workspace:FindFirstChild("Map") then
                for i,v in next, workspace.Map:GetChildren() do
                    if v.Name == "Exit" and v:FindFirstChild("BoundingBox") then
                        Update()
                        firetouchinterest(Collider, v.BoundingBox, 0)
                        firetouchinterest(Collider, v.BoundingBox, 1)
                        game:GetService("RunService").Heartbeat:wait()
                    end
                end
                
                for i,v in next, workspace:GetChildren() do
                    if v.Name:find("KeyChest") and v:FindFirstChild("ChestBase") then
                        if v.ChestBase:FindFirstChild("ChestOpen") then v.ChestBase:Remove() break end
                        Update()
                        Collider.CFrame = v.ChestBase.CFrame - v.ChestBase.CFrame.lookVector*-30 + Vector3.new(0,2,0)
                    end
                end
            end
        end
    end

    function sell()
        Update()
        function check(table, target)
            if #table ~= 0 then
                for i,v in next, table do
                    if v:lower() == target then
                        return true
                    end
                end
                return false
            else
                return false
            end
        end
        local Items = Player.PlayerGui.MainGui.Inventory.Items.ItemFrame
        local Inv = Profile.Inventory.Items
        for i,v in next, Items:GetChildren() do
            if v:FindFirstChild("Stars") and v:FindFirstChild("ViewportFrame") and v.Stars:FindFirstChild("TextLabel") and v.ViewportFrame:FindFirstChildWhichIsA("Model") then
                local stars = v.Stars.TextLabel.Text
                local weapon = v.ViewportFrame:FindFirstChildWhichIsA("Model").Name
                for a,b in next, Inv:GetChildren() do
                    if JSON.Common == true and stars == "1" and b.Name == weapon and not weapon:find("Dye") and not weapon:find("Ticket") then
                        game.ReplicatedStorage.Shared.Drops.SellItems:InvokeServer({b})
                    end
                    if JSON.Uncommon == true and stars == "2" and b.Name == weapon and weapon ~= "Doughnut" then
                        game.ReplicatedStorage.Shared.Drops.SellItems:InvokeServer({b})
                    end
                    if JSON.Rare == true and stars == "3" and b.Name == weapon and not weapon:find("Cake") then
                        game.ReplicatedStorage.Shared.Drops.SellItems:InvokeServer({b})
                    end
                    if JSON.Epic == true and stars == "4" and b.Name == weapon and weapon ~= "Sundae" then
                        game.ReplicatedStorage.Shared.Drops.SellItems:InvokeServer({b})
                    end
                    if b:FindFirstChild("UpgradeLimit") and b.UpgradeLimit.Value < tonumber(JSON.UpgradeLimit) then
                        game.ReplicatedStorage.Shared.Drops.SellItems:InvokeServer({b})
                    end
                end
            end
        end
    end
    
    function equip()
        Update()
        repeat game:GetService("RunService").Heartbeat:wait() until Profile:FindFirstChild("Equip") and Profile:FindFirstChild("Inventory")
        
	    function primWeapon()
            for i,v in next, Profile.Equip.Primary:GetChildren() do
                if v:IsA("Folder") ~= nil then
                    return v
                end
            end
        end
        
        function primArmor()
            for i,v in next, Profile.Equip.Armor:GetChildren() do
                if v:IsA("Folder") ~= nil then
                    return v
                end
            end
        end
        
        local maxWeapon = require(game.ReplicatedStorage.Shared.Combat):GetItemStats(primWeapon()).Attack
        local maxArmor = require(game.ReplicatedStorage.Shared.Combat):GetItemStats(primArmor()).Defense

        for i,v in next, Profile.Inventory.Items:GetChildren() do
            if v:FindFirstChild("Level") and v:FindFirstChild("UpgradeLimit") then
                local invWeapon = require(game.ReplicatedStorage.Shared.Combat):GetItemStats(v).Attack
                local invArmor = require(game.ReplicatedStorage.Shared.Combat):GetItemStats(v).Defense
                if invWeapon ~= nil and tonumber(invWeapon) > tonumber(maxWeapon) then
                    game.ReplicatedStorage.Shared.Inventory.EquipItem:FireServer(v, Profile.Equip["Primary"])
                end
                if invArmor ~= nil and tonumber(invArmor) > tonumber(maxArmor) then
                    game.ReplicatedStorage.Shared.Inventory.EquipItem:FireServer(v, Profile.Equip["Armor"])
                end
            end
        end
    end

    function endmission()
        if Player.PlayerGui:FindFirstChild("MainGui") and (Player.PlayerGui.MainGui.MissionRewards.Visible == true or Player.PlayerGui.MainGui.TowerFinish.Description.Text == "Collect your rewards! (35)") then
            game.ReplicatedStorage.Shared.Missions.GetMissionPrize:InvokeServer()
            game.ReplicatedStorage.Shared.Missions.GetMissionPrize:InvokeServer()
            if JSON.Equip == true then
                equip()
            end
            wait()
            if JSON.Sell == true then
                sell()
            end
            if JSON.Redo == true then
                if JSON.CustomD == true then
                    game.ReplicatedStorage.Shared.Teleport.StartRaid:FireServer(missions(JSON.Mission))
                else
                    game.ReplicatedStorage.Shared.Teleport.StartRaid:FireServer(autoMissions())
                end
            else
                game.ReplicatedStorage.Shared.Missions.NotifyReadyToLeave:FireServer()
                game.ReplicatedStorage.Shared.Teleport.TeleportRequest:FireServer(worlds())
            end
        end
    end

    function keys()
        for i,v in next, get(require(game.ReplicatedStorage.Shared.Combat).AttackTargets) do
            if type(v) == "table" then
                return v
            end
        end
    end

    function AttackTargets(mobs, vectors)
        local Classes = {
            ["Swordmaster"] = {"Swordmaster1", "Swordmaster2", "Swordmaster3", "Swordmaster4", "Swordmaster5", "Swordmaster6", "CrescentStrike1", "CrescentStrike2", "CrescentStrike3", "Leap"},
            ["Mage"] = {"Mage1", "ArcaneBlastAOE", "Mage2", "ArcaneBlast", "Mage1", "Mage3", "ArcaneWave1", "Mage1","Mage2", "Mage4", "ArcaneWave1", "Mage5", "ArcaneWave2", "Mage1", "ArcaneWave3", "Mage2", "ArcaneWave4", "ArcaneWave5", "ArcaneWave6", "ArcaneWave7", "ArcaneWave8", "ArcaneWave9"},
            ["Defender"] = {"Defender1", "Defender2", "Defender3", "Defender4", "Defender5", "Groundbreaker", "Spin1", "Spin2", "Spin3", "Spin4", "Spin5"},
            ["DualWielder"] = {"DualWield1", "DualWield2", "DualWield3", "DualWield4", "DualWield5", "DualWield6", "DualWield7", "DualWield8", "DualWield9", "DualWield10", "DualWieldUltimateHit1", "DualWieldUltimateSword1", "DualWieldUltimateHit2", "DualWieldUltimateSword2", "DualWieldUltimateHit3", "DualWieldUltimateSword3", "DualWieldUltimateSword4", "DualWieldUltimateHit4", "DualWieldUltimateSword5", "DualWieldUltimateHit5", "DualWieldUltimateSword6", "DualWieldUltimateHit6", "DualWieldUltimateSword7", "DualWieldUltimateHit7", "DualWieldUltimateSword8", "DualWieldUltimateHit8", "DualWieldUltimateSword9", "DualWieldUltimateSword10", "DualWieldUltimateSword11", "DualWieldUltimateSword12", "DualWieldUltimateSword13", "DualWieldUltimateSword14", "DualWieldUltimateSword15", "DualWieldUltimateSword16",},
            ["Guardian"] = {"Guardian1", "Guardian2", "Guardian3", "Guardian4", "SlashFury1", "SlashFury2", "SlashFury3", "SlashFury4", "SlashFury5", "SlashFury6", "SlashFury7", "SlashFury8", "SlashFury9", "SlashFury10", "SlashFury11", "SlashFury12", "SlashFury13", "RockSpikes1", "RockSpikes2", "RockSpikes3", "SwordPrison1", "SwordPrison2", "SwordPrison3", "SwordPrison4", "SwordPrison5", "SwordPrison6", "SwordPrison7", "SwordPrison8", "SwordPrison9", "SwordPrison10", "SwordPrison11", "SwordPrison12"},
            ["IcefireMage"] = {"IcefireMage1", "IcySpikes1", "IcySpikes2", "IcySpikes3", "IcySpikes4", "IcefireMageFireballBlast", "IcefireMageFireball", "LightningStrike1", "LightningStrike2", "LightningStrike3", "LightningStrike4", "LightningStrike5", "IcefireMageUltimateFrost", "IcefireMageUltimateMeteor1"},
            ['Berserker'] = {"Berserker1", "Berserker2", "Berserker3", "Berserker4", "Berserker5", "Berserker6", "AggroSlam", "GigaSpin1", "GigaSpin2", "GigaSpin3", "GigaSpin4", "GigaSpin5", "GigaSpin6", "GigaSpin7", "GigaSpin8", "Fissure1", "Fissure2", "FissureErupt1", "FissureErupt2", "FissureErupt3", "FissureErupt4", "FissureErupt5"},
            ["Paladin"] = {"Paladin1", "Paladin2", "Paladin3", "Paladin4", "LightThrust1", "LightThrust2", "LightPaladin1", "LightPaladin2"},
            ["MageOfLight"] = {"MageOfLight", "MageOfLightBlast"},
            ["Demon"] = {"Demon1","Demon3", "Demon2", "Demon4", "Demon5", "Demon6", "Demon7", "Demon8", "Demon9", "Demon10", "Demon11", "Demon12", "Demon13", "Demon14", "Demon15", "Demon16", "Demon17", "Demon18", "Demon19", "Demon20", "Demon21", "Demon22", "Demon23", "Demon24", "Demon25", "Demon26", "DemonDPS1", "DemonDPS2", "DemonDPS3", "DemonDPS4", "DemonDPS5", "DemonDPS6", "DemonDPS7", "DemonDPS8", "DemonDPS9", "ScytheThrowDPS1", "ScytheThrowDPS2", "ScytheThrowDPS3", "DemonLifeStealDPS", "DemonSoulDPS1", "DemonSoulDPS2", "DemonSoulDPS3"},
        }
        Update()
        if #keys() < 50 then
            --refill
            local randomKey = (#keys() > 0 and table.remove(keys(), #keys()))
            local refillTable = game.ReplicatedStorage.Remotes.GetKeys:InvokeServer(randomKey)    
            if type(refillTable) == "table" then
                for i,v in next, refillTable do
                    table.insert(keys(), v)
                end
            end
        end
        game.ReplicatedStorage.Shared.Combat.AttackTarget:FireServer(mobs, vectors, Classes[Profile.Class.Value][math.random(1,#Classes[Profile.Class.Value])], table.remove(keys(), #keys()))
    end

    spawn(function()
        while game:GetService("RunService").Heartbeat:wait() do
            local mobs = {}
            local vectors = {}
            for i,v in next, workspace.Mobs:GetChildren() do
                if v:IsA("Model") and v:FindFirstChild("Collider") and v:FindFirstChild("HealthProperties") and v.HealthProperties:FindFirstChild("Health") and v.HealthProperties.Health.Value > 0 then
                    local mag = (Collider.Position - v.Collider.Position).magnitude
                    if mag <= 80 then
                        table.insert(mobs, v)
                        table.insert(vectors, Vector3.new(99999,999999,999999))
                    end
                end
            end
            for i,v in next, workspace:GetChildren() do
                if v:IsA("Model") and v.PrimaryPart ~= nil and v:FindFirstChild("HealthProperties") and v.HealthProperties:FindFirstChild("Health") and v.HealthProperties.Health.Value > 0 then
                    local mag = (Collider.Position - v.PrimaryPart.Position).magnitude
                    if mag <= 80 then
                        table.insert(mobs, v)
                        table.insert(vectors, Vector3.new(99999,999999,999999))
                    end
                end
            end
            if workspace:FindFirstChild("MissionObjects") then
                for i,v in next, workspace.MissionObjects:GetChildren() do
                    if v:IsA("Folder") and v.Name == "SpikeCheckpoints" then
                        for i1,v1 in next, v:GetChildren() do
                            if v1:IsA("Model") and v1.PrimaryPart ~= nil and v1:FindFirstChild("HealthProperties") and v1.HealthProperties:FindFirstChild("Health") and v1.HealthProperties.Health.Value > 0 then
                                local mag = (Collider.Position - v1.PrimaryPart.Position).magnitude
                                if mag <= 80 then
                                    table.insert(mobs, v1)
                                    table.insert(vectors, Vector3.new(99999,999999,999999))
                                end
                            end
                        end
                    elseif v:IsA("Folder") and v.Name == "TowerLegs" then
                        for i1,v1 in next, v:GetChildren() do
                            if v1:IsA("Model") and v1.PrimaryPart ~= nil and v1:FindFirstChild("HealthProperties") and v1.HealthProperties:FindFirstChild("Health") and v1.HealthProperties.Health.Value > 0 then
                                local mag = (Collider.Position - v1.PrimaryPart.Position).magnitude
                                if mag <= 80 then
                                    table.insert(mobs, v1)
                                    table.insert(vectors, Vector3.new(99999,999999,999999))
                                end
                            end
                        end
                    elseif v:IsA("Model") and v.PrimaryPart ~= nil and v:FindFirstChild("HealthProperties") and v.HealthProperties:FindFirstChild("Health") and v.HealthProperties.Health.Value > 0 then
                        local mag = (Collider.Position - v.PrimaryPart.Position).magnitude
                        if mag <= 80 then
                            table.insert(mobs, v)
                            table.insert(vectors, Vector3.new(99999,999999,999999))
                        end
                    end
                end
            end
            for i,v in next, mobs do
                local closestDist = 80
                if v.PrimaryPart ~= nil and v:FindFirstChild("HealthProperties") and v.HealthProperties:FindFirstChild("Health") and v.HealthProperties.Health.Value > 0 then
                    local mag = (Collider.Position - v.PrimaryPart.Position).magnitude
                    if mag <= closestDist then
                        local temp = mobs[i]
                        mobs[i] = mobs[1]
                        mobs[1] = temp
                        closestDist = mag
                        AttackTargets(mobs, vectors)
                    end
                end
            end
        end
    end)
    
    spawn(function()
        while game:GetService("RunService").Heartbeat:wait() do
            if game.ReplicatedStorage:FindFirstChild("FloorCounter") then
                local playerHasExtra = game.ReplicatedStorage.Shared.VIP.IsExtraDrop:InvokeServer(Player)
                local currentFloor = game.ReplicatedStorage.FloorCounter.Value
                if currentFloor < 15 then
                    if playerHasExtra == false then
                        for i,v in next, get(require(game.ReplicatedStorage.Shared.Chests).Start)[7] do
                            if tostring(v):lower():find("chestgold") then
                                game.ReplicatedStorage.Shared.Chests.OpenChest:FireServer(i)
                            end
                        end
                    else
                        for i,v in next, get(require(game.ReplicatedStorage.Shared.Chests).Start)[7] do
                            if tostring(v):lower():find("raid") then
                                game.ReplicatedStorage.Shared.Chests.OpenChest:FireServer(i)
                            end
                        end
                    end
                else
                    for i,v in next, get(require(game.ReplicatedStorage.Shared.Chests).Start)[7] do
                        if tostring(v):lower():find("raid") then
                            game.ReplicatedStorage.Shared.Chests.OpenChest:FireServer(i)
                        end
                    end
                end
                for i,v in next, get(require(game.ReplicatedStorage.Shared.Chests).Start)[7] do
                    if not tostring(v):find("Raid") then
                        game.ReplicatedStorage.Shared.Chests.OpenChest:FireServer(i)
                    end
                end
            else
                break
            end
        end
    end)

    spawn(function()
        while game:GetService("RunService").Heartbeat:wait() do
            for i,v in next, workspace.Coins:GetDescendants() do
                if v:IsA("Part") then
                    Update()
                    v.Transparency = 1
                    v.CFrame = Collider.CFrame + Vector3.new(0,-5,0)
                end
            end
        end
    end)

    function keyChestOpened()
        if workspace:FindFirstChild("Map") then
            for i,v in next, workspace:GetChildren() do
                if v.Name:find("KeyChest") and not v:FindFirstChild("ChestBase") then
                    return true
                end
            end
        end
    end
	
	function stuff()
		Update()
        game.ReplicatedStorage.Remotes.SetSheathed:FireServer(true)
		pcall(function()
			Character.HealthProperties.LastDamage:Remove()
			Character.HealthProperties.BarrierHealth:Remove()
		end)
        Collider.BodyVelocity.MaxForce = Vector3.new(100000,100000,100000) 
        for i,v in next, Character:GetDescendants() do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
    stuff()
    
    local oldPosBoss = nil
    workspace.Mobs.ChildAdded:connect(function(v)
        if game.PlaceId ~= 4050468028 and v:IsA("Model") and v.Parent and (v.Name:lower():find("boss") or v.Name == "MagmaGigaBlob" or v.Name == "FireCastleCommander") and not v:FindFirstChild("NoHealthbar") and v:FindFirstChild("Collider") and v:FindFirstChild("FromSpawnPart") and v:FindFirstChild("HealthProperties") and v:FindFirstChild("MobProperties") and v.MobProperties:FindFirstChild("Busy") and not v.MobProperties.Busy:FindFirstChild("Before") and v.HealthProperties.Health.Value > 0 then
            if v.HealthProperties.Health.Value > 0 and tostring(v.FromSpawnPart.Value) ~= "CliffsideMama" and tostring(v.FromSpawnPart.Value) ~= "BridgeMama" and tostring(v.FromSpawnPart.Value) ~= "DireCaveSpawn" and tostring(v.FromSpawnPart.Value) ~= "DireBridgeSpawn" or v.FromSpawnPart.Value == nil then
                oldPosBoss = v.Collider.Position.Y - 15
            end
        end
    end)

    spawn(function()
        while game:GetService("RunService").Heartbeat:wait() do
                local mob = getmob()
                local boss = getboss()
                local obj = getobject()
                if obj then
                    repeat game:GetService("RunService").Heartbeat:wait()
                        if not obj:FindFirstChild("HealthProperties") or obj.PrimaryPart == nil or obj.HealthProperties.Health.Value <= 0 then break end
                        Update()
                        Collider.CFrame = obj.PrimaryPart.CFrame + Vector3.new(0,-20,0)
                    until obj.HealthProperties.Health.Value <= 0 
                elseif not obj and mob then
                    local oldPosMob = (mob:FindFirstChild("Collider") and mob.Collider.Position.Y)
                    repeat game:GetService("RunService").Heartbeat:wait()
                        if keyChestOpened() or not mob:FindFirstChild("HealthProperties") or not mob:FindFirstChild("Collider") or mob.Collider.Position.Y < oldPosMob or mob.HealthProperties.Health.Value <= 0 then break end
                        Update()
                        Collider.CFrame = mob.Collider.CFrame + Vector3.new(0,10,0)
                    until mob.HealthProperties.Health.Value <= 0
                elseif not (obj and mob) and boss then
                    repeat game:GetService("RunService").Heartbeat:wait()
                        if changeTarget() or not boss.Parent or not boss:FindFirstChild("Collider") or (oldPosBoss ~= nil and boss.Collider.Position.Y < oldPosBoss) or not boss:FindFirstChild("HealthProperties") or not boss:FindFirstChild("MobProperties") or not boss:FindFirstChild("FromSpawnPart") or boss:FindFirstChild("NoHealthbar") or boss.HealthProperties.Health.Value <= 0 then break end
                        Update()
                        Collider.CFrame = boss.Collider.CFrame + Vector3.new(0,10,0)
                        boss.Collider.CanCollide = false
                    until boss.HealthProperties.Health.Value <= 0
                end
                trigger()
                endmission()
        end
    end)
end

if game.Players:FindFirstChild(Player.Name) then
    if game.PlaceId == 2727067538 then
        repeat wait() until game.ReplicatedStorage.ProfileCollections:FindFirstChild(Player.Name)
        for i,v in next, game.ReplicatedStorage.ProfileCollections[Player.Name].Profiles:GetChildren() do
            if v:FindFirstChild("Selected") and v:FindFirstChild("GUID") and v.Selected.Value == true then
                game.ReplicatedStorage.Shared.Teleport.JoinGame:FireServer(v.GUID.Value)
            end
        end
    else
        repeat wait() until workspace.Characters:FindFirstChild(Player.Name)
        repeat wait() until Player.Character
        repeat wait() until Player.Character:FindFirstChild("Collider")
        if workspace:FindFirstChild("MenuRings") then
            if JSON.CustomD == true then
                game.ReplicatedStorage.Shared.Teleport.StartRaid:FireServer(missions(JSON.Mission))
            else
                game.ReplicatedStorage.Shared.Teleport.StartRaid:FireServer(autoMissions())
            end
        else
            Farm()
        end
    end
end

if syn then
    syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/hoangsalty/Scripts/master/WZAutoFarm.lua"))()')
end

library:Init()
