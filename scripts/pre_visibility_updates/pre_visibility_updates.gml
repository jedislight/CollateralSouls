{
    var visibility_grid = Simulation.visibility_grid;
    ds_grid_clear(visibility_grid, false);
    with(Object)
    {
        if(light_blocking == false)
        {
            instance_deactivate_object(id);
        }
    }
}
