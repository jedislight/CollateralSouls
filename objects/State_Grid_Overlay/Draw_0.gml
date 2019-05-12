draw_set_blend_mode(bm_add);
if(instance_number(Actor) >= 1 and not keyboard_check_direct(vk_f5))
{
    var grid = Simulation.state_grid;
    var width = ds_grid_width(grid) - Simulation.state_loop_back_pad;
    var height = ds_grid_height(grid);
    
    draw_rectangle_colour(x,y,x+width,y+height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    for(var xx = 0; xx < width ; ++xx) for(var yy = 0; yy < height; ++yy)
    {
        if(grid[#xx, yy] != noone)
        {
            var color = c_red;
            if(grid[#xx,yy])
            {
                color = c_lime;
            }
            draw_point_colour(x+xx,y+yy,color);
        }
    }
}

if(instance_number(Actor) >= 1 and not keyboard_check_direct(vk_f5))
{
    var ox = 16 * Simulation.grid_width - Actor.network_width;
    var oy = 16 * Simulation.grid_height - Actor.network_height;  
    draw_rectangle_colour(ox,oy,16 * Simulation.grid_width,16 * Simulation.grid_height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);  
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        var node_state = Actor.network[#xx,yy];
        if(node_state == 0)
        {
            draw_point_colour(ox+xx,oy+yy,c_red);
        }
        else if(node_state == 1)
        {
            draw_point_colour(ox+xx,oy+yy,c_lime);
        }
        
    }
}

draw_set_blend_mode(bm_normal);

