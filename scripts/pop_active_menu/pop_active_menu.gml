{
    var menu = get_active_menu();
    with(menu){instance_destroy()}
    ds_list_delete(Simulation.menu_system.menu_stack, ds_list_find_index(Simulation.menu_system.menu_stack, menu));
}
