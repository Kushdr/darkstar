-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Evil Weapon
-----------------------------------

require("scripts/zones/Rolanberry_Fields/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local mobID = mob:getID();
    if (Eldritch_Edge_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Eldritch_Edge");
        if (ToD <= os.time() and GetMobAction(Eldritch_Edge) == 0) then
            if (math.random(1,5) == 5) then
                UpdateNMSpawnPoint(Eldritch_Edge);
                GetMobByID(Eldritch_Edge):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Eldritch_Edge", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;