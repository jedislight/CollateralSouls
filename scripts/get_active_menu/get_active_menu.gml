{
    var size = ds_list_size(Simulation.menu_system.menu_stack);
    if(size > 0)
    {
        return Simulation.menu_system.menu_stack[|size-1];
    }
    
    return noone;
}
