{
    clear_visibility();
    update_visibility_grid();
    
    update_light_grid(Simulation.map_left, Simulation.map_top, Simulation.map_right, Simulation.map_bottom);
    update_fog_of_war()
    update_target_list()
    with(One_Turn_Visibility_Source)
    {
        instance_destroy();
    }
}
