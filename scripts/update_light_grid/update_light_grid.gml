/// @description update_light_grid(left, top, right, bottom)
/// @param left
/// @param  top
/// @param  right
/// @param  bottom
{
    var max_left = argument0;
    var max_top = argument1;
    var max_right = argument2;
    var max_bottom = argument3;    
    
    var light_grid = Simulation.light_grid
    var grid_width = Simulation.grid_width
    var grid_height = Simulation.grid_height
    var blocking = Simulation.light_blocking_grid
    ds_grid_clear(light_grid, 0.0)
    ds_grid_clear(light_color_grid, c_white)
    ds_grid_clear(blocking, false);
    var nav_map = Simulation.light_path_grid;
    mp_grid_clear_all(nav_map)
    var lights = Simulation.temp_list;
    ds_list_clear(lights);
    var path = Simulation.temp_path;
    path_clear_points(path);
    with(Object)
    {
        if(self.light_blocking)
        {
            mp_grid_add_cell(nav_map, self.x, self.y)
            blocking[# self.x, self.y] = true;
        }  
        if(self.luminosity > 0.0)
        {
            ds_list_add(lights, id)
        }
    }
    
    if(instance_number(Daylight))
    {
        ds_grid_clear(light_grid, 1.0);
        ds_grid_clear(light_color_grid, c_white);
        return 0;
    }    
    
    var grid_width_last_index = grid_width -1;
    var grid_height_last_index = grid_height -1;
    var visibility_grid = Simulation.visibility_grid;
    for(var i = 0; i < ds_list_size(lights); ++i)
    {
        var light = lights[| i]
        var luminosity = light.luminosity;
        var lum_counter = luminosity;
        var spread = 0;
        while(lum_counter > Simulation.light_minimum)
        {
            lum_counter = lum_counter / 2;
            spread += 1;
        }
        
        var left = clamp(floor(light.x-spread), 0, grid_width_last_index)
        var right = clamp(ceil(light.x+spread), 0, grid_width_last_index) 
        var top = clamp(ceil(light.y-spread), 0, grid_height_last_index)
        var bottom = clamp(floor(light.y+spread), 0, grid_height_last_index) 
        
        left = clamp(left, max_left, max_right);
        right = clamp(right, max_left, max_right);
        top = clamp(top,max_top, max_bottom);
        bottom = clamp(bottom, max_top, max_bottom);
        for(var xx = left; xx <= right; ++xx) for(var yy = top; yy <= bottom; ++yy)
        {
            var max_strength = luminosity / power(2, abs(xx - light.x) + abs(yy - light.y));
            if(visibility_grid[#xx,yy] and max_strength > Simulation.light_minimum)
            {
                var dist = -1;
                if(ds_grid_get_sum(blocking, min(xx,light.x), min(yy,light.y), max(xx,light.x), max(yy,light.y) == 0))
                {
                    dist = sqrt(sqr(xx-light.x) + sqr(yy-light.y));
                }
                else if(mp_grid_path(nav_map, path, xx, yy, light.x, light.y, true))
                {
                    dist = path_get_length(path)
                }
                if(dist >= 0)
                {
                    var strength = luminosity / power(2, dist);
                    if(strength > .1)
                    {
                        var prev_light_strength = light_grid[# xx, yy];
                        var color_ratio = (prev_light_strength ) / (strength + prev_light_strength);
                        light_grid[# xx, yy] = prev_light_strength + strength
                        var light_color = light.light_color;
                        if(light.frozen > 0)
                        {
                            show_debug_message("FROZEN LIGHT");
                            light_color = make_colour_rgb(65,142,243);
                        }
                        light_color_grid[#xx, yy] = merge_colour(light_color, light_color_grid[#xx,yy], color_ratio);
                    }                
                }
            }
        }
    }
    
    //prebake lights
    var original_lighting = Simulation.temp_grid;
    var original_lighting_color = Simulation.temp_grid2;
    var object_render_grid = Simulation.temp_grid3;
    ds_grid_copy(original_lighting, light_grid)
    ds_grid_copy(original_lighting_color, light_color_grid)
    ds_grid_clear(object_render_grid, noone)
    with(Object)
    {
        if(!overdraw)
        {
            if (x < grid_width and y < grid_height)
            {
                if (object_render_grid[#x,y] == noone)
                {
                    object_render_grid[#x, y] = id;     
                }
                else
                {            
                    if(object_render_grid[#x,y]._layer < self._layer)
                    {
                        object_render_grid[#x, y] = id;                
                    }
                }
            }
        }
    }
    for(var xx = 0; xx < grid_width; xx++) for(var yy = 0; yy < grid_height; yy++)
    {
        if(not visibility_grid[#xx,yy])
        {
            continue;
        }
        var color = original_lighting_color[#xx, yy];
        var bright = original_lighting[#xx, yy];
        var object = object_render_grid[#xx, yy];

        if (object != noone and object.light_blocking)
        {
            bright = ds_grid_get_max(original_lighting,xx-1,yy-1,xx+1, yy+1)
            if(bright < Simulation.light_minimum)
            {
                bright = 0.0
            }
            var r = min(colour_get_red(color), colour_get_red(object.color));
            var g = min(colour_get_green(color), colour_get_green(object.color));
            var b = min(colour_get_blue(color), colour_get_blue(object.color));
            color = make_colour_rgb(r,g,b); 
            if(object.light_blocking)
            {
                for (var cx = xx-1; cx <= xx+1; ++cx) for(var cy = yy -1; cy <= yy+1; ++cy)
                {
                    if(!(cx < 0 or cx >= grid_width or cy < 0 or cy >= grid_height))
                    {
                        var neighbor = object_render_grid[# cx, cy];
                        if( neighbor != noone)
                        {
                            if(neighbor.visible and original_lighting[#cx,cy] != 0.0)
                            {
                                var light_color = original_lighting_color[#cx, cy];
                                var r = min(colour_get_red(light_color), colour_get_red(color));
                                var g = min(colour_get_green(light_color), colour_get_green(color));
                                var b = min(colour_get_blue(light_color), colour_get_blue(color));
                                color = make_colour_rgb(r,g,b); 
                            }
                        }
                    }                
                }
            }
        }
        light_color_grid[# xx, yy] = color;
        light_grid[#xx, yy] = bright;
    }
    
    //player proximity sense
    var player = instance_find(Player,0);
    if(instance_exists(player))
    {
        var player_bright = light_grid[#player.x, player.y];
        ds_grid_set_region(light_grid, clamp(player.x-1, 0, grid_width), clamp(player.y-1, 0, grid_height), clamp(player.x+1, 0, grid_width), clamp(player.y+1, 0, grid_height), 1.0);
        light_grid[#player.x, player.y] = player_bright;        
    }
}
