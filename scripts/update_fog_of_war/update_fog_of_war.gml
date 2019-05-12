{
    var player = instance_find(Player, 0);
    with(Object)
    {
        if(Simulation.explored_grid[#x,y] == false and visible and Simulation.light_grid[#x,y] > 0.0)
        {
            Simulation.explored_grid[#x,y] = true;
            if(instance_exists(player) and perk_exists(player, Perk_Background_Seeker) and not condition_exists(Condition_No_Regeneration))
            {
                var fx = instance_create(x*16, y*16, FX_Regen);
                fx.target = player;
                player.fighter.hp += player.fighter.hp_max/1400.0;
                player.fighter.hp = min(player.fighter.hp_max, player.fighter.hp);
            }
        }
    }
}
