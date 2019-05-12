{
    var start_time = get_timer();
    var grid = argument0;
    var queue_x = Simulation.temp_queue;
    var queue_y = Simulation.temp_queue2;
    var queue_d = Simulation.temp_queue3;
    
    ds_queue_clear(queue_x);
    ds_queue_clear(queue_y);
    ds_queue_clear(queue_d);
    ds_queue_enqueue(queue_x, argument1);
    ds_queue_enqueue(queue_y, argument2);
    ds_queue_enqueue(queue_d, 0);
    
    var maximum = argument3;
    var grid_width = ds_grid_width(grid);
    var grid_height = ds_grid_height(grid);
    
    //walk out
    var count = 0;
    while(not ds_queue_empty(queue_x))
    {
        var xx = ds_queue_dequeue(queue_x);
        var yy = ds_queue_dequeue(queue_y);
        var d = ds_queue_dequeue(queue_d);
                
        var start_value = grid[#xx,yy];
        if(start_value == DISTANCE_MAP_UNSET)
        {
            ++count;
            grid[#xx,yy] = d;
            var next_d = d + 1;
            for(var nx = -1; nx <= 1; ++nx) for(var ny = -1; ny <= 1; ++ny)
            {
                var fx = xx + nx;
                var fy = yy + ny;
                if(fx < 0 or fx >= grid_width or fy < 0 or fy >= grid_height or d >= maximum or (nx == ny and nx == 0) and grid[#fx,fy] == DISTANCE_MAP_UNSET)
                {
                    continue;
                }
                ds_queue_enqueue(queue_x, fx)
                ds_queue_enqueue(queue_y, fy)
                ds_queue_enqueue(queue_d, next_d)
            }
        }
    }
    
    show_debug_message("populate_distance_map: " +string(get_timer() - start_time) + "    "+string(count) + "     " + string(grid_width*grid_height));
    
    //mark the rest unreachable
    for(var xx = 0; xx < grid_width; ++xx) for(var yy = 0; yy < grid_height; ++yy)
    {
        if(grid[#xx,yy] == DISTANCE_MAP_UNSET)
        {
            grid[#xx,yy] = DISTANCE_MAP_SOLID;
        }
    }
}
