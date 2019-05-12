pop_active_menu()
with(Simulation)
{
    show_debug_message("CHALLENGE GAME STARTING");
    condition_clear();
    challenge_seeded();
    open_challenge_menu();
    show_debug_message("simulation_restart::goto_next_level()");
    goto_next_level();
    show_debug_message("simulation_restart::simulation_update()");
    simulation_update();
    show_debug_message("simulation_restart::simulation_update()");
    simulation_update();
    show_debug_message("simulation_restart::log_clear()");
    log_clear();
}

