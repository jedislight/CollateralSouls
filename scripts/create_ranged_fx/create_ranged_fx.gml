/// @description create_ranged_fx(attacker, target, offset)
/// @param attacker
/// @param  target
/// @param  offset
{
    var attacker = argument0;
    var target = argument1;
    var offset = argument2;
    var fx_type = FX_Ranged;
    var delay = argument3;
    if(perk_exists(attacker, Perk_Storm_Of_Vengance))
    {
        fx_type = FX_Storm;
    }
    else if(perk_exists(attacker, Perk_Tentacle_Whip))
    {
        fx_type = FX_Tentacle;
    }
    
    var flash = instance_create(attacker.x, attacker.y, Muzzle_Flash);
    flash.color = attacker.fighter.ranged_color_start;
    
    var fx = instance_create(attacker.x, attacker.y, fx_type);
    fx.tx = target.x + random_range(-offset, offset)
    fx.ty = target.y + random_range(-offset, offset)
    fx.ttl = attacker.fighter.ranged_fx_ttl;
    fx.color_start = attacker.fighter.ranged_color_start;
    fx.color_end = attacker.fighter.ranged_color_end;
    fx.delay = delay;
    if(attacker.fighter.charged)
    {
        fx.width = 3;
    }
    
    if(perk_exists(attacker, Perk_Shotgun) and not perk_exists(attacker, Perk_Storm_Of_Vengance))
    {
        repeat(4)
        {
            var fx = instance_create(attacker.x, attacker.y, fx_type);
            fx.tx = target.x + random_range(-1.0, 1.0)
            fx.ty = target.y + random_range(-1.0, 1.0)
            fx.ttl = attacker.fighter.ranged_fx_ttl;
            fx.color_start = attacker.fighter.ranged_color_start;
            fx.color_end = attacker.fighter.ranged_color_end;        
        }
    }
}
