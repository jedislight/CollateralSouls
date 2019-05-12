{
    var player = instance_find(Player,0);
    if(player <= 0 or not instance_exists(owner))
    {
        return false;
    }
    
    var has_seen_player_before = owner.has_seen_player;
    
    var player_visible = false;
    if (Simulation.light_grid[#player.x,player.y] > Simulation.light_minimum and is_visible_quick(owner, player))
    {
        owner.has_seen_player = true;
        last_known_player_x = player.x
        last_known_player_y = player.y    
        player_visible = true;
    }
    
    if(last_known_player_x == -1 or has_seen_player_before == false)
    {
        return false;
    }
    
    if( player_visible and get_range_penalty(owner, player) < 0.2)
    {
        fighter_attack(owner.fighter, player.fighter, true);
    }  
    else if(not AI_approach_player(noone))
    {
        AI_approach_player(Creature);
    }
}
