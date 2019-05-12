{
    var visibility_source_list = Simulation.temp_list;
    ds_list_clear(visibility_source_list);
    with(Visibility_Source)
    {
        ds_list_add(visibility_source_list, id);
    }
    
    pre_visibility_updates();
    
    for(var i = 0; i < ds_list_size(visibility_source_list); ++i)
    {
        update_visibility_grid_for(visibility_source_list[|i]);
    }
    
    finalize_visibility();
}
