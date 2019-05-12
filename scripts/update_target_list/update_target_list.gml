{
    ds_list_clear(Simulation.targeting.targets);
    var player = instance_find(Player, 0);
    var unsorted = ds_list_create();
    if(instance_exists(player))
    {
        with(Creature)
        {
            if(targetable and visible and (Simulation.light_grid[#x,y] > 0.0 or perk_exists(player, Perk_Darkvision)) and (get_cover(player, id) > 0.0 or get_cover(id, player) > 0.0))
            {
                ds_list_add(unsorted, id);
                if(instance_exists(fighter) and fighter.has_been_targetable == false and player.turns_taken > 0 and Config.reals[?"show_alerts"])
                {
                    var fx = create_floating_text_fx(x,y, "!", c_yellow);
                    fx.text_only = true
                    fighter.has_been_targetable = true;
                }
            }
        }
        
        while(not ds_list_empty(unsorted))
        {
            var closest = unsorted[|0];
            var closest_distance = 9999;
            var ci = 0;
            for(var i = 0; i < ds_list_size(unsorted); ++i)
            {
                var obj = unsorted[|i];
                var d = distance(obj, player); 

                if(d < closest_distance)
                {
                    closest = obj;
                    closest_distance = d;
                    ci = i;
                }
            }

            ds_list_add(Simulation.targeting.targets, closest);
            ds_list_delete(unsorted, ci);
        }
    }
    else
    {
        ds_list_copy(Simulation.targeting.targets, unsorted);
    }
    
    if(ds_list_find_index(Simulation.targeting.targets, Simulation.targeting.target) < 0)
    {
        Simulation.targeting.target = noone;
        with(Fighter_Component)
        {
            seeker_bonus = 0
        }
    }
    
    ds_list_destroy(unsorted);
}
