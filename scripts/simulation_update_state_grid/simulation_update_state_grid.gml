{
    if(instance_number(Actor) == 0)
    {
        return 0;
    }
    var px = 0;
    var py = 0;
    var player = instance_find(Player,0);
    if(instance_exists(player))
    {
        px = player.x;
        py = player.y;   
    }
    ds_grid_clear(Simulation.state_grid, noone);
    
    if(ds_list_size(Simulation.perks) > 120)
    {
        show_debug_message("To many perks for 2 rows of player data!");
    }
    
    //section 4 explored grid
    ds_grid_copy_looping(Simulation.explored_grid,   Simulation.state_grid, Simulation.grid_width * 0, Simulation.grid_height * 1, px, py);
    
    //section 2 visible grid
    ds_grid_copy_looping(Simulation.visibility_grid, Simulation.state_grid, Simulation.grid_width * 1, Simulation.grid_height * 0, px, py);

    var state_grid_width = ds_grid_width(Simulation.state_grid);
    var state_grid_height = ds_grid_height(Simulation.state_grid);
    for(var xx = 0; xx < state_grid_width; ++xx) for(var yy = 0; yy < state_grid_height; ++yy)
    {
        if(Simulation.state_grid[#xx,yy] == false)
        {
            Simulation.state_grid[#xx,yy] = noone;
        }
    }
    
    //section 6 - player data
    if(instance_exists(player))
    {
        //player perks
        for(var i = 0; i < ds_list_size(Simulation.perks); ++i)
        {
            var tx = Simulation.grid_width * 2 + i mod Simulation.grid_width;
            var ty = Simulation.grid_height * 1 + i div Simulation.grid_height;

            Simulation.state_grid[#tx, ty] = perk_exists(player, Simulation.perks[|i]);
        }
        
        //player hp
        for(var i = 0; i < Simulation.grid_width; ++i)
        {
            var tx = Simulation.grid_width * 2 + i
            var ty = Simulation.grid_height * 1 + 2;            
            var hp_ratio = player.fighter.hp * 1.0 / player.fighter.hp_max;
            var place_ratio = i * 1.0 / Simulation.grid_width;
            Simulation.state_grid[#tx, ty] = hp_ratio > place_ratio;
        }
        
        //turn rotation
        var tx = Simulation.grid_width * 2 + (player.turns_taken mod Simulation.grid_width);
        var ty = Simulation.grid_height * 1 + 3;
        Simulation.state_grid[#tx, ty] = true;
        
        //player xp
        for(var i = 0; i < Simulation.grid_width; ++i)
        {
            var tx = Simulation.grid_width * 2 + i
            var ty = Simulation.grid_height * 1 + 4;    
            var relative_xp = player.fighter.xp - player.fighter.prev_level;
            var relative_xp_to_next = player.fighter.next_level - player.fighter.prev_level;
            var xp_ratio = relative_xp * 1.0 / relative_xp_to_next;
            var place_ratio = i * 1.0 / Simulation.grid_width;
            Simulation.state_grid[#tx, ty] = xp_ratio > place_ratio;
        }
        
        //previous actor input
        if(instance_number(Actor) >= 1)
        {
            var tx = Simulation.grid_width * 2 + Actor.chosen_input_response;
            var ty = Simulation.grid_height * 1 + 5;
            Simulation.state_grid[#tx, ty] = true;
        }
        
        var active_menu = get_active_menu();
        if(instance_exists(active_menu))
        {
            //menu items available
            var size = ds_list_size(active_menu.menu_items);
            for(var i = 0; i < Simulation.grid_width and i < size; ++i)
            {
                var tx = Simulation.grid_width * 2 + i
                var ty = Simulation.grid_height * 1 + 6;    
                Simulation.state_grid[#tx, ty] = true;
            }
            //menu selected index
            var tx = Simulation.grid_width * 2 + active_menu.selected_index;
            var ty = Simulation.grid_height * 1 + 7;    
            
            Simulation.state_grid[#tx, ty] = true;
            
            //menu text
            var size = ds_list_size(active_menu.menu_items);
            for(var i = 0; i < Simulation.grid_height - 8 and i < size; ++i)
            {
                var ty = Simulation.grid_height * 1 + 8 + i;    
                var menu_text = active_menu.menu_items[|i].text;
                for(var xx = 1; xx < string_length(menu_text) and xx < Simulation.grid_width; ++xx)
                {
                    var char = string_char_at(menu_text, xx);
                    var tx = Simulation.grid_width * 2 + xx
                    Simulation.state_grid[#tx, ty] = ord(char) < ord("l");
                }
            }
            
        }        
    }
    
    //section 1 passable grid
    ds_grid_set_region(Simulation.state_grid, Simulation.grid_width * 0, Simulation.grid_height * 0, Simulation.grid_width * 1 - 1, Simulation.grid_height * 1 - 1, noone);
    with(Object)
    {
        if(Simulation.explored_grid[#x,y])
        {
                var creature = instance_exists(fighter) and Simulation.visibility_grid[#x,y];
                var new_passable = passable;
                if(creature)
                {
                    new_passable = false;
                }

                var ty = y - py;
                var tx = x - px;
                if(ty < 0)
                {
                    ty += Simulation.grid_height;
                }
                if(tx < 0)
                {
                    tx += Simulation.grid_width;
                }
                var old_passable = Simulation.state_grid[#Simulation.grid_width * 0 + tx, Simulation.grid_height * 0 + ty];
                if(old_passable == noone)
                {
                    old_passable = new_passable;
                }                
                Simulation.state_grid[#Simulation.grid_width * 0 + tx, Simulation.grid_height * 0 + ty] = old_passable or new_passable;
        }
    }
        
    //section 3 creature grid
    ds_grid_set_region(Simulation.state_grid, Simulation.grid_width * 2, Simulation.grid_height * 0, Simulation.grid_width * 3 - 1, Simulation.grid_height * 1 - 1, noone);
    with(Creature)
    {
        if(Simulation.visibility_grid[#x,y])
        {
            var ty = y - py;
            var tx = x - px;
            if(ty < 0)
            {
                ty += Simulation.grid_height;
            }
            if(tx < 0)
            {
                tx += Simulation.grid_width;
            }
            Simulation.state_grid[#Simulation.grid_width * 2 + tx, Simulation.grid_height * 0 + ty] = true;
        }
    }
    
    //section 5 usable grid
    ds_grid_set_region(Simulation.state_grid, Simulation.grid_width * 1, Simulation.grid_height * 1, Simulation.grid_width * 2 - 1, Simulation.grid_height * 2 - 1, noone);
    with(Usable_Object)
    {
        if(Simulation.explored_grid[#x,y])
        {
            var ty = y - py;
            var tx = x - px;
            if(ty < 0)
            {
                ty += Simulation.grid_height;
            }
            if(tx < 0)
            {
                tx += Simulation.grid_width;
            }
            Simulation.state_grid[#Simulation.grid_width * 1 + tx, Simulation.grid_height * 1 + ty] = true;
        }
    }
    
    //Actor Loop Back
    if(instance_number(Actor) > 0)
    {
        var network_size = Actor.network_width * Actor.network_height;
        for(var i = 0; i < network_size; ++i)
        {
            var xx = i mod Actor.network_width;
            var yy = i div Actor.network_width;
            
            var tx = Simulation.grid_width * 3 + i mod Simulation.state_loop_back_pad;
            var ty = Simulation.grid_height * 0 + i div Simulation.state_loop_back_pad;
            Simulation.state_grid[#tx, ty] = Actor.network[#xx,yy];
        }
    }
}
