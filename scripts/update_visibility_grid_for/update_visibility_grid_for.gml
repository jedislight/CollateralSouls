/// @description update_visibility_gird_for(looker_object)
/// @param looker_object
{
    var light_grid = Simulation.light_grid;
    var grid_width = Simulation.grid_width;
    var grid_height = Simulation.grid_height;
    var visibility_grid = Simulation.visibility_grid;
    
    var cursor = instance_create(0,0, Uncarved);
    for( var xx = 0; xx < grid_width; ++xx) for(var yy =0; yy < grid_height; ++yy)
    {
        cursor.x = xx;
        cursor.y = yy;
        var already_visible = visibility_grid[#xx,yy];
        if( not already_visible)
        {
            visibility_grid[#xx,yy] = is_visible_quick_pre_screened(cursor, argument[0]);
        }
    }
    with(cursor){instance_destroy();}
}
