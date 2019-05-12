/// @description fighter_turn_tick(fighter)
/// @param fighter
{
    var fighter = argument0;   
    if(fighter.hp < fighter.hp_max)
    {
        fighter.hp += min(fighter.hp_regen, fighter.hp_max - fighter.hp)
    }
    if(burn_duration > 0)
    {
        burn_duration -= 1;
        var flash = instance_create(fighter.owner.x, fighter.owner.y, Muzzle_Flash);
        flash.light_color = c_orange;
        flash.luminosity = 12;
        
        //keep attack last so the fighter is not destroyed while processing other things
        if(instance_exists(burn_inflictor))
        {
            fighter_attack(burn_inflictor.fighter, id, false, 0, 1, "'s fire burns ", true);
        }
    }
}
