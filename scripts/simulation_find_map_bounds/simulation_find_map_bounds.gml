Simulation.map_left = 0;
Simulation.map_right = grid_width;
Simulation.map_top = 0;
Simulation.map_bottom = grid_height;

with(Wall)
{
    Simulation.map_left = min(Simulation.map_left, x);
    Simulation.map_right = max(Simulation.map_right, x);
    Simulation.map_top = min(Simulation.map_top, y);
    Simulation.map_bottom = max(Simulation.map_bottom, y);
}
