{
    var side_x = choose(0, Simulation.grid_width -1);
    var side_y = irandom_range(0, Simulation.grid_height -1);
    
    var lat_x = irandom_range(0, Simulation.grid_width -1);
    var lat_y = choose(0, Simulation.grid_height -1);
    
    world_carve_line(Floor, Water, side_x, side_y, lat_x, side_y);
    world_carve_line(Floor, Water, lat_x, lat_y, lat_x, side_y);
}
