ttl -= 1;
if(ttl == 0)
{
    with(Simulation)
    {
        update_light_grid(Simulation.map_left, Simulation.map_top, Simulation.map_right, Simulation.map_bottom);
        update_fog_of_war();
    }
    instance_destroy();
}

