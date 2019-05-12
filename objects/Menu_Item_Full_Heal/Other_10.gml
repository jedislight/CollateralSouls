player = instance_find(Player, 0);
if(instance_exists(player))
{
    player.fighter.hp = player.fighter.hp_max;
    ga_design_event("player:perk_gained:Perk_Full_Heal");   
    Simulation.score_keeper.floor_full_heal_bonus += 1;
}
pop_active_menu()

