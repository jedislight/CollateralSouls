/// @description goto_next_level()
{
    floor_score_update();
    with(Object)
    {
        if(!persistent and instance_exists(id))
        {
            instance_destroy();
        }
    }
    
    Simulation.boon = false;
    Simulation.curse = false;
    Simulation.floor_cleared_for_count = 0;
    if(instance_number(Actor) > 0)
    {
        actor_next();
        random_set_seed(Actor.species_count)
    }
    var seed_condition = condition_get(Condition_Seeded);
    if(instance_exists(seed_condition))
    {
        var seed = seed_condition.value;
        var player = instance_find(Player,0);
        if(instance_exists(player))
        {
            seed += player.floors_covered * 23;   
        }
        random_set_seed(seed);
    }
    generate_world(30, 4, 8, 4, 8); 
    //debug_create_debug_room();
    
    simulation_find_map_bounds();
    clear_visibility();
    clear_fow();
    update_fog_of_war();
    update_light_grid(Simulation.map_left, Simulation.map_top, Simulation.map_right, Simulation.map_bottom);
    update_fog_of_war();
    instance_create(0,0, Frame_Delay_Light_Updater);
    var player = instance_find(Player,0);
    if(player)
    {
        if(player.floors_covered > 0)
        {
            ga_progression_complete_event("Floor" + string(round(player.floors_covered)));
        }
        player.floors_covered += 1.0;
        ga_progression_start_event("Floor" + string(round(player.floors_covered)));
        var regen = player.fighter.hp_max * 0.33;
        if(perk_exists(player, Perk_Regeneration))
        {
            regen = player.fighter.hp_max * perk_get(player, Perk_Regeneration).value;
        }
        
        if(perk_exists(player, Perk_Background_Seeker) or perk_exists(player, Perk_Background_Sadist) or condition_exists(Condition_No_Regeneration))
        {
            regen = 0;
        }
        
        player.fighter.hp = clamp(player.fighter.hp + regen, 0.0, player.fighter.hp_max);
        
        log_message(player.name + " has entered floor " + string(player.floors_covered))
        if(ds_list_size(player.history) != 0)
        {
            log_history("<", c_green);
        }
    }
    
    with(Perk)
    {
        if(temporary and instance_exists(owner) and ds_exists(owner.perks, ds_type_map))
        {
            ds_map_delete(owner.perks, object_index);
            instance_destroy();
        }
    }
    with(Perk_Blood_Secret_Ritual)
    {
        limit = 1000
    }
    
    Simulation.last_player_turn_taken_time = current_time
}
