{
    var player = instance_find(Player,0);
    if(owner.turn_delay_counter>0)
    {
        owner.turn_delay_counter -= 1;
        return 0;
    }
    if(instance_exists(player) and instance_exists(owner))
    {
        var d = distance(player, owner);
        var range_potential = (1-get_range_penalty(owner, player)) * owner.fighter.ranged_accuracy * owner.fighter.ranged_damage;
        var melee_potential = (owner.fighter.accuracy * owner.fighter.damage) / d;
        //show_debug_message("Range P: " + string(range_potential) + " Melee P: " + string(melee_potential));
        
        if(melee_potential < range_potential)
        {
            range_player_if_visible();            
        }
        else
        {
            melee_player_if_visible();
        }
        owner.turn_delay_counter += owner.turn_delay;
    }
}
