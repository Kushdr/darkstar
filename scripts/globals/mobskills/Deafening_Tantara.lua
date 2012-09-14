---------------------------------------------
--  Deafening Tantara
--
--  Description: Inflicts silence in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10'
--  Notes: Doesn't use this if its horn is broken.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)


    power = 1;
    tic = 0;
    duration = 30;

    isEnfeeble = true;
    typeEffect = EFFECT_SILENCE;
    statmod = MOD_INT;
    accrand = math.random(1,4);
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand ~= 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,power,tic,duration);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end
    return typeEffect;

end;