
-- this is the file to put all your custom logic functions into.
-- if you dont want to use the json based logic you can switch to a graph-based logic method.
-- the needed functions for that are in `/scripts/logic/graph_logic/logic_main.lua`.
--  Tracker:FindObjectForCode("@location_name/section_name").AvailableChestCount;


-- ^$CanAccessNightmare
function CanAccessNightmare();
    if (Tracker:FindObjectForCode("@Eve of Destruction/").AvailableChestCount > 0) then
        return ACCESS_NONE;
    end

    if (Tracker:FindObjectForCode("@Reach Level/30").AvailableChestCount > 0 and UseLevelMilestoneQuests() == ACCESS_NORMAL) then
        return ACCESS_SEQUENCEBREAK;
    end
    
    return ACCESS_NORMAL;
end

-- ^$CanAccessHell
function CanAccessHell()
    if (Tracker:FindObjectForCode("@Eve of Destruction/Nightmare").AvailableChestCount > 0) then
        return ACCESS_NONE;
    end

    if (Tracker:FindObjectForCode("@Reach Level/55 (Nightmare)").AvailableChestCount > 0 and UseLevelMilestoneQuests() == ACCESS_NORMAL) then
        return ACCESS_SEQUENCEBREAK;
    end

    return ACCESS_NORMAL;
end

-- ===============================================================

-- ^$UnlockedGate|<ACT>|<DIFFICULTY>|<GATE>
-- ^$UnlockedGate|1|Normal|1
-- ^$UnlockedGate|1|Nightmare|1
-- ^$UnlockedGate|1|Hell|1
function UnlockedGate (act, difficulty, gate)
    if (IsZoneLocked() == ACCESS_NONE) then
        return ACCESS_NORMAL;
    end
    
    --print("UnlockedGate act : " .. act .. " difficulty : " .. difficulty .. " gate : " .. gate .. " has useZoneLockingRandomKey : " .. HAS("useZoneLockingRandomKey"));

    if (HAS("useZoneLockingRandomKey") == ACCESS_NORMAL) then
        --print("progressiveact" .. act .. "key(" .. string.lower(difficulty) .. ")");
        if (HAS("progressiveact" .. act .. "key(" .. string.lower(difficulty) .. ")", tonumber(gate)) == ACCESS_NONE) then
            return ACCESS_NONE;
        end
    else
        --print("@Act " .. act .. " (" .. difficulty .. ")/Gate " .. gate .. " Cleared");
        if (Tracker:FindObjectForCode("@Act " .. act .. " (" .. difficulty .. ")/Gate " .. gate .. " Cleared").AvailableChestCount > 0) then
            return ACCESS_NONE;
        end
    end

    return ACCESS_NORMAL;
end

-- ===============================================================

-- ^$HasDone|<LOCATION/SECTION>
function HasDone(locationSectionCode)
    if (Tracker:FindObjectForCode("@" .. locationSectionCode).AvailableChestCount > 0) then
        return ACCESS_NONE;
    end

    return ACCESS_NORMAL;
end

-- ^$HasEnterZone|<ACT>|<ZONE>
function HasEnterZone(actZone, zoneToEnter)
    if (Tracker:FindObjectForCode("@Enter (Act " .. actZone .. ")/" .. zoneToEnter).AvailableChestCount > 0 and UseExplorationQuests() == ACCESS_NORMAL) then
        return ACCESS_NONE;
    end

    return ACCESS_NORMAL;
end

-- ^$HasHuntMonster|<ACT>|<MONSTER>
function HasHuntMonster(actMonster, MonsterToEnter)
    if (Tracker:FindObjectForCode("@Hunt (Act " .. actMonster .. ")/" .. MonsterToEnter).AvailableChestCount > 0 and UseHuntingQuests() == ACCESS_NORMAL) then
        return ACCESS_NONE;
    end

    return ACCESS_NORMAL;
end


-- function <name> (<parameters if needed>)
--     <actual code>
--     <indentations are just for readability>
-- end
--
                