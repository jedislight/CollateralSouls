++frame;
player_turn_taken = false
var player_move_x = 0
var player_move_y = 0
var player = instance_find(Player,0);
var active_menu = get_active_menu();
if(instance_exists(active_menu))
{
    //menu input
    var menu_shortcut_performed = false;
    var size = ds_list_size(active_menu.menu_items);
    for(var i = 0; i < size; ++i)
    {
        if(menu_shortcut_performed)
        {
            break;
        }
        with(active_menu.menu_items[|i])
        {
            var key = shortcut;
            if(is_string(key))
            {
                key = ord(key);
            }
            
            if(key != 0 and keyboard_check_pressed(key))
            {
                event_perform(ev_other, ev_user0);
                menu_shortcut_performed = true;
            }
        }
    }
    if( menu_shortcut_performed == true )
    {
        //no-op
    }
    else if(input_up)
    {
        menu_cycle(active_menu, -1);
    }
    else if(input_down)
    {
        menu_cycle(active_menu, 1);
    }
    else if(input_menu_confirm)
    {
        menu_confirm(active_menu);
    }
    else if(input_escape)
    {
        active_menu.selected_index = active_menu.default_item_index
        menu_cycle(active_menu, 1);
        menu_cycle(active_menu, -1);
        menu_confirm(active_menu);
    }
    
    last_player_turn_taken_time = current_time
}
else if(player != noone and (instance_number(FX) == 0 or Config.reals[?"wait_on_fx"] == false))
{
    //player input
    if (input_help)
    {
        open_help_menu();
    }
    else if(input_up)
    {
        player_move_y = -1
    }
    else if(input_down)
    {
        player_move_y = 1
    }
    else if(input_left)
    {
        player_move_x = -1
    }
    else if(input_right)
    {
        player_move_x = 1
    }
    else if(input_up_left)
    {
        player_move_x = -1
        player_move_y = -1
    }
    else if(input_up_right)
    {
        player_move_x = 1
        player_move_y = -1
    }
    else if(input_down_right)
    {
        player_move_x = 1
        player_move_y = 1
    }
    else if(input_down_left)
    {
        player_move_x = -1
        player_move_y = 1
    }
    else if(input_wait)
    {
        player_turn_taken = true
        var usable = is_useable(player.x, player.y);
        if(instance_exists(usable))
        {
            script_execute(usable.on_use);
        }
        else
        {
            if(perk_exists(player, Perk_First_Aid))
            {
                var heal = player.fighter.last_hit_taken * perk_get(player, Perk_First_Aid).value;
                if(heal > 0)
                {
                    player.fighter.hp += heal;
                    player.fighter.hp = clamp(player.fighter.hp, 0.0, player.fighter.hp_max);
                    player.fighter.last_hit_taken = 0;            
                    log_message(player.name + " heals " + string(ceil(heal)) + " from First Aid");
                }
            }
            
            for(var i = 0 ; i < ds_list_size(Simulation.perks); ++i)
            {
                if(perk_exists(player, Simulation.perks[|i]))
                {
                    var perk = perk_get(player, Simulation.perks[|i]);
                    if(script_exists(perk.ritual))
                    {
                        script_execute(perk.ritual, player);
                    }
                }
            }
        }
        
        if(instance_exists(Simulation.targeting.target) and perk_exists(player, Perk_Heartseeker))
        {
            Simulation.targeting.target.fighter.seeker_bonus += player.fighter.ranged_damage * 2;
        }
    }
    else if(input_target_cycle_backwards)
    {
        target_cycle(-1);
    }
    else if(input_target_cycle)
    {
        target_cycle(1);
    }
    else if(input_ranged_attack)
    {
        if(instance_exists(Simulation.targeting.target))
        {
            if(perk_exists(player, Perk_Pact_Ritual))
            {
                for(var i = 0 ; i < ds_list_size(Simulation.perks); ++i)
                {
                    if(perk_exists(player, Simulation.perks[|i]))
                    {
                        var perk = perk_get(player, Simulation.perks[|i]);
                        if(script_exists(perk.ritual))
                        {
                            script_execute(perk.ritual, player);
                        }
                    }
                }
            }
            fighter_attack(player.fighter, Simulation.targeting.target.fighter, true);
            player_turn_taken = true
        }
        else
        {
            target_cycle(1);
        }
    }
    else if(input_insightful_sheet and perk_exists(player, Perk_Insightfull) and instance_exists(Simulation.targeting.target))
    {
        open_character_sheet(Simulation.targeting.target);   
    }
    else if(input_character_sheet)
    {
        open_character_sheet(player);   
    }
    else if(input_escape and not instance_exists(active_menu))
    {
        open_game_menu()
    }
    else if(keyboard_check_pressed(ord("A")) and keyboard_check_direct(vk_alt))
    {
        if(instance_number(Actor) == 0)
        {
            instance_create(0,0, Actor);
        }
    }
    else if (resting)
    {
        if(player.fighter.hp >= player.fighter.hp_max)
        {
            log_message("Rest complete!");
            resting = false;
        }
        else with(Creature)
        {
            if(visible and Simulation.light_grid[#x,y] > Simulation.light_minimum)
            {
                Simulation.resting = false;
                log_message(player.name + " sees a " + name + " and stops resting")
                break;
            }
        }
        
        if(resting)
        {
            player_turn_taken = true;
        }
    }
    
    //player move
    if(player_move_x != 0 or player_move_y != 0 and not resting )
    {
        var new_x = player_move_x + player.x
        var new_y = player_move_y + player.y
        var fight_target = is_fightable(new_x, new_y);
        if(fight_target)
        {
            player_turn_taken = true
            fighter_attack(player.fighter, fight_target.fighter, false);
        }
        else if(is_passable(new_x, new_y))
        {
            player_turn_taken = true
            player.x = new_x
            player.y = new_y
            player.fighter.charged = false;
        }
    }
    
    if(mouse_check_button_pressed(mb_left))
    {
        var world_mouse_x = floor(mouse_x / Renderer.grid_size);
        var world_mouse_y = floor(mouse_y / Renderer.grid_size);
        for(var i = 0; i < ds_list_size(targeting.targets); ++i)
        {
            var canidate = targeting.targets[|i];
            if(canidate.x == world_mouse_x and canidate.y == world_mouse_y)
            {
                var target_index = ds_list_find_index(targeting.targets, targeting.target);
                var canidate_index = ds_list_find_index(targeting.targets, canidate);
                
                target_cycle(canidate_index - target_index);
                break;
            }
        }
    }
}

//debug input
if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("D")) and DEBUG)
{
    show_debug_overlay(true)   
    Renderer.draw_debug_grid_mouse_tooltip = true;
    Renderer.draw_debug_grid_overlay = true;
}
else if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("A")) and DEBUG)
{
    instance_create(0,0, Analytics);
}

else if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("P")) and DEBUG)
{
    open_lore_menu();
}
else if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("F")) and DEBUG)
{
    player_turn_taken = true
    goto_next_level()
}
else if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("L")) and DEBUG)
{
    fighter_gain_xp(player.fighter, player.fighter.level * 10);
}
else if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("V")) and DEBUG)
{
    ds_grid_clear(explored_grid, true);    
}
else if(keyboard_check_direct(vk_control) and keyboard_check_pressed(ord("T")) and DEBUG)
{
    soak_test = !soak_test;
}


//player turn
if(player_turn_taken)
{    
    var player_time = (current_time - last_player_turn_taken_time) / 1000;
    var idle_time = player_time - 1.0;
    idle_time = max(0.0, idle_time);
    Simulation.score_keeper.floor_idle_time += idle_time;
    with(Fighter_Component)
    {
        if(owner != player)
        {
            attacked_this_turn = false;
        }
    }
    
    with(Object)
    {
        frozen = max(frozen-1, 0);
    }
    
    //build ais list since on_update can end up killing AI_Components
    // need to be able to check validity{
    update_light_grid(player.x, player.y, player.x, player.y);
    var ais = ds_list_create();
    var flesh_guise = perk_get(player, Perk_Flesh_Guise_Ritual);
    with(AI_Component)
    {
        ds_list_add(ais, id);
    }

    for(var i = 0; i < ds_list_size(ais); ++i)
    {
        var ai = ais[|i];
        if((instance_exists(ai) and instance_exists(ai.owner) and ai.owner.frozen > 0) or (instance_exists(flesh_guise) and flesh_guise.active and ai.owner.undead == false))
        {
            continue;
        }
        if(instance_exists(ai))
        {
            with(ai){script_execute(on_update);}
        }
    }
    ds_list_destroy(ais);
    
    with(Creature)
    {
        var usable = is_useable(x,y);
        if(instance_exists(usable))
        {
            if(usable.object_index == Teleporter)
            {
                var target_teleporter = noone;
                with(Teleporter)
                {
                    if(id != usable.id)
                    {
                        target_teleporter = id;
                    }
                }
                
                if(is_passable(target_teleporter.x, target_teleporter.y))
                {
                    x = target_teleporter.x;
                    y = target_teleporter.y;
                    if(target_teleporter.visible)
                    {
                        instance_create(target_teleporter.x, target_teleporter.y, FX_Teleport_Target);
                    }
                    if(usable.visible)
                    {
                        instance_create(usable.x, usable.y, FX_Teleport_Source);
                    }
                }
            }
        }
    }
    
    //keeping solar armor after AI so it doesn't interfere with attacked this turn for player
    var solar = ds_list_create();
    var fury_attacker = ds_list_create();
    var fury_target = ds_list_create();
    with(Creature)
    {
        if(perk_exists(id, Perk_Solar_Armor))
        {
            ds_list_add(solar, id);
        }
        
        if(instance_exists(player))
        {
            if(abs(player.x-x) <= 1 and abs(player.y-y) <= 1)
            {
                if(perk_exists(player, Perk_Fury))
                {
                    ds_list_add(fury_target, id);
                    ds_list_add(fury_attacker, player);
                }
                if(perk_exists(id, Perk_Fury))
                {
                    ds_list_add(fury_attacker, id);
                    ds_list_add(fury_target, player);                
                }
            }
        }
    }
    for(var i = 0; i < ds_list_size(fury_attacker); ++i)
    {
        if(instance_exists(fury_attacker[|i]) and instance_exists(fury_target[|i]))
        {
            fighter_attack(fury_attacker[|i].fighter, fury_target[|i].fighter, false);
        }
    }
    ds_list_destroy(fury_attacker);
    ds_list_destroy(fury_target);
    if(perk_exists(player, Perk_Solar_Armor))
    {
        ds_list_add(solar, player);
    }
    for(var i = 0; i < ds_list_size(solar); ++i)
    {
        var solar_object = solar[|i];
        if(not instance_exists(solar_object))
        {
            continue;
        }
        with(Fighter_Component)
        {
            if(instance_exists(owner) and instance_exists(solar_object) and owner != solar_object)
            {
                var dist = distance(solar_object, owner);
                var strength = (1.0 * solar_object.luminosity) / power(2, dist);
                if(strength > Simulation.light_minimum and is_visible_quick(owner, solar_object) and is_visible_quick(solar_object, owner))
                {
                    if(owner == player or solar_object == player)//stop enemy friendly fire
                    {
                        fighter_attack(solar_object.fighter, id, true, 0, perk_get(solar_object, Perk_Solar_Armor).value, " burns ", true)
                    }
                }
            }
        }
    }
    ds_list_destroy(solar);    
    
    with(Fighter_Component)
    {
        fighter_turn_tick(id);
    }
    
    with(Object)
    {
        ++turns_taken;
    }
    
    with(Muzzle_Flash)
    {
        if(turns_taken >= 2)
        {
            instance_destroy()
        }
    }
    
    //world collapse
    if(instance_number(Creature) == 0 and player.floors_covered != Simulation.final_floor)
    {
        floor_cleared_for_count += 1;
    }
    if(floor_cleared_for_count == 1)
    {
        log_message(player.name + "'s feel alone");
    }
    else if(floor_cleared_for_count == 5)
    {
        Simulation.score_keeper.floor_collapse_bonus = 0;
        if(Config.reals[?"collapse_event"])
        {
            log_message("The world begins to collapse");
        }
        else
        {
            Simulation.score_keeper.floor_collapse_bonus += 3;
            Simulation.score_keeper.game_collapse_bonus += 3;
            fighter_gain_xp(player.fighter, 3);
            floor_cleared_for_count = 0;
            goto_next_level();
        }
    }
    else if(floor_cleared_for_count > 5)
    {
        var transition = false;
        var any_collapsed = false;
        with(Object)
        {
            if(color == c_fuchsia)
            {
                color = c_black;
                any_collapsed = true;
            }
            if(color != c_black and id != player and choose(true,false))
            {
                color = c_fuchsia;
            }
            if(color == c_black and x == player.x and y == player.y)
            {
                transition = true;
            }
        }
        if(any_collapsed)
        {
            log_message(player.name + " learns much from the collapsing world");
            fighter_gain_xp(player.fighter, 1);
            var fx = instance_create(30, 20, FX_Teleport_Source);
            fx.begin_radius = 20*16;
            fx.radius = fx.begin_radius;
            fx.acceleration = -.5;
            Simulation.score_keeper.floor_collapse_bonus += 1;
            Simulation.score_keeper.game_collapse_bonus += 1;
        }
        if(transition)
        {
            floor_cleared_for_count = 0;
            goto_next_level();
        }
    }
    
    var start = get_timer();
    simulation_update();
    var now = get_timer();
    show_debug_message("simulation update took: "+string(now-start))
    if(DEBUG)
    {
        log_message("simulation update took: "+string(now-start))
    }
    ga_design_value_event("performance:simulation_update", now-start); 
    
    if(instance_exists(player))
    {
        player.fighter.attacked_this_turn = false;
    }
    with(Perk_Blood_Secret_Ritual)
    {
        active = false;
    }
    with(Perk_Stone_Body_Ritual)
    {
        if(active)
        {
            remaining -= 1;
            if(remaining == 0)
            {
                active = false
                owner.fighter.armor -= value
                owner.fighter.damage -= boost
            }
        }
    }
    with(Perk_Inferno_Rounds_Ritual)
    {
        if(active)
        {
            remaining -= 1;
            if(remaining == 0)
            {
                active = false
            }
        }
    }
    with(Perk_Flesh_Guise_Ritual)
    {
        if(active)
        {
            remaining -= 1;
            if(remaining == 0)
            {
                active = false
            }
        }
    }
    
    with(Perk_Teleport_Ritual)
    {
        if(active)
        {
            remaining -= 1;
            if(remaining == 0)
            {
                active = false
            }
        }
    }

    if(DEBUG and debug_grid_overlay.mode == DEBUG_GRID_MODE_ACCURACY and instance_exists(player))
    {    
        ds_grid_clear(debug_grid_overlay.grid, c_black);
        cursor = instance_create(0,0, Floor);
        for(var xx = 0; xx < grid_width; xx++) for(var yy = 0; yy < grid_height; yy++)
        {
            cursor.x = xx;
            cursor.y = yy;
            if(is_visible_quick(cursor, player) and is_visible_quick(player,cursor))
            {
                var target_cover = 0.0;
                if(!perk_exists(player, Perk_Shotgun))
                {
                    target_cover = clamp(100 - floor(get_cover(player, id) * 100), 0, 100);
                }
    
                var target_distance = distance(cursor, player);
                var target_out_of_range = out_of_range_by(player.fighter.ranged_distance_min, player.fighter.ranged_distance_max, target_distance);
                var target_range_penalty = get_range_penalty(player, cursor);
                var total_penalty = abs(target_cover*.01) + abs(target_range_penalty)
                var final_accuracy = player.fighter.ranged_accuracy - total_penalty + 0.5
                var scaled = final_accuracy * 0.5 + 0.5;//0-1
                if(scaled > 0)
                {
                    Simulation.debug_grid_overlay.grid[#cursor.x,cursor.y] = merge_colour(c_red, c_green, scaled);
                }
            }
        }
        with(cursor){instance_destroy();}
    }
    else if(DEBUG and debug_grid_overlay.mode == DEBUG_GRID_MODE_LIGHT_COLOR and instance_exists(player))
    {
        ds_grid_copy(debug_grid_overlay.grid, light_color_grid);
    }
    
    if(instance_number(Actor) >= 1 and instance_exists(player) and player.turns_taken - last_xp_gain > 150)
    {
        fighter_attack(player.fighter, player.fighter, false, 0, 1);
    }
    if(instance_number(Actor) >= 1 and instance_exists(player))
    {
        Actor.player_turns_taken = player.turns_taken;
        Actor.frame = 0;
        
        if(instance_number(Creature) == 0)
        {
            if(is_final_floor())
            {
                open_win_menu();
            }
            else
            {
                goto_next_level();
            }
        }
    }
    last_turn = current_time;
    last_player_turn_taken_time = last_turn;
    if(instance_exists(player))
    {
        if(player.attacked_this_turn)
        {
            player.attacks_this_floor += 1;
            if(player.hit_this_turn)
            {
                player.hits_this_floor += 1;
            }
        }
        player.attacked_this_turn = false;
        player.hit_this_turn = false
    }
}

//game restart
if(instance_number(Player) == 0 and not instance_exists(get_active_menu()) and game_exiting == false)
{
    show_debug_message("Simulation_Restart()");
    simulation_restart();
    player = instance_find(Player,0);
    show_debug_message("player after restart:" +string(player));
}

simulation_update_state_grid();

