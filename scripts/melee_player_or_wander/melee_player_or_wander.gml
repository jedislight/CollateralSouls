{
    var player = instance_find(Player,0);
    if(not instance_exists(player) or not instance_exists(owner))
    {
        return false;
    }
    
    if (Simulation.light_grid[#player.x,player.y] > Simulation.light_minimum and is_visible_quick(owner, player))
    {
        last_known_player_x = player.x
        last_known_player_y = player.y    
    }
    
    if(last_known_player_x == -1)
    {
        AI_wander_around();
    }    
    else if(abs(player.x - owner.x) <= 1 and abs(player.y - owner.y) <= 1)
    {
        fighter_attack(owner.fighter, player.fighter, false);
    }
    else if(not AI_approach_player(noone))
    {
        AI_approach_player(Creature);
    }
}
