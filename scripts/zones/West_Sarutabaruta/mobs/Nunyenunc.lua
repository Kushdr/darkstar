-----------------------------------
-- Area: West Sarutabaruta (115)
--  NM:  Nunyenunc
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Nunyenunc's Window Open Time
    local wait = math.random(7200,10800);
    SetServerVariable("[POP]Nunyenunc", os.time() + wait); -- 2-3 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Nunyenunc");
    SetServerVariable("[PH]Nunyenunc", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

