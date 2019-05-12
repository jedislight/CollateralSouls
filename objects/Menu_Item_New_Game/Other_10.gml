pop_active_menu()
with(Simulation)
{
    condition_clear();
    show_debug_message("simulation_restart::goto_next_level()");
    goto_next_level();
    show_debug_message("simulation_restart::simulation_update()");
    simulation_update();
    show_debug_message("simulation_restart::simulation_update()");
    simulation_update();
    show_debug_message("simulation_restart::log_clear()");
    log_clear();
}

