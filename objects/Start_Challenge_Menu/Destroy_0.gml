with(Simulation)
{
    show_debug_message("CHALLENGE GAME STARTING");
    condition_clear();
    if(other.text == "")
    {
        challenge_random();
    }
    else
    {
        challenge_seeded(other.text);
    }
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

while(!ds_list_empty(menu_items))
{
    with(menu_items[|0]){instance_destroy()};
    ds_list_delete(menu_items, 0);
}

