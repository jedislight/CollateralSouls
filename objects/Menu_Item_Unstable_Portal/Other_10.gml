pop_active_menu();
with(Player)
{
    malice += 1;
}
with(Simulation)
{
    goto_next_level()
    player_turn_taken = true;
};
open_new_perk_menu();

