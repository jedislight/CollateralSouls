{
    var visibility_grid = Simulation.visibility_grid;
    var grid_width = Simulation.grid_width;
    var grid_height = Simulation.grid_height;

    instance_activate_all();     
    
    var object_render_grid = Simulation.temp_grid
    ds_grid_copy(object_render_grid, visibility_grid);
    with(Object)
    {
        visible = visibility_grid[#x,y];
    }
    
    //update wall visibility    
    with(Wall)
    {
        for (var cx = x-1; cx <= x+1; ++cx) for(var cy = y -1; cy <= y+1; ++cy)
        {
            if(visible){break;}
            if(!(cx < 0 or cx >= grid_width or cy < 0 or cy >= grid_height))
            {
                if(object_render_grid[# cx, cy])
                {
                    visible = true;
                    visibility_grid[#x,y] = true;
                }
            }
        }
    }
}
