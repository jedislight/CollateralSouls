{
    if(instance_number(Actor) > 0)
    {
        if(Actor.this_session > 1)
        {
            game_end();
            return 0;
        }
    }
    
    open_main_menu()
    Simulation.floor_cleared_for_count = 0;
    
    Simulation.last_xp_gain = 0;
}
