/// @description get_range_penalty(attacker, target)
/// @param attacker
/// @param  target
{
    var attacker = argument0;
    var target = argument1;
    var ranged_penalty_modifier = 1.0;
    var target_distance = distance(target, attacker);
    var target_out_of_range = out_of_range_by(attacker.fighter.ranged_distance_min, attacker.fighter.ranged_distance_max, target_distance);
    var target_range_penalty_base = attacker.fighter.ranged_distance_min;
    if(target_out_of_range >= 0)
    {
        target_range_penalty_base = attacker.fighter.ranged_distance_max;
    }
    else
    {
        if(perk_exists(attacker, Perk_Sniper_Rifle))
        {
            ranged_penalty_modifier += 1.0 + attacker.fighter.level * 0.13;
        }
    }
    target_range_penalty_base = max(target_range_penalty_base, 1.0);
    var target_range_penalty = abs(1.0 * target_out_of_range / target_range_penalty_base);
    return target_range_penalty * ranged_penalty_modifier;
}
