pop_active_menu()
var event = noone;
var type = "";
var roll = random_range(0.0,1.0);
var player = instance_find(Player,0);
if(instance_exists(player))
{
    if(player.fighter.level == 1)
    {
        roll = 1.0;
    }
}
if(Config.reals[?"first_lore"])
{
    show_debug_message("First Lore Box Encountered");
    roll = 1.0;
    Config.reals[?"first_lore"] = 0;
    config_save();
}
show_debug_message("Lore Box Roll: " + string(roll));
if( roll >= 0.4)
{
    ds_list_shuffle(Simulation.boons);
    event = instance_create(0,0,Simulation.boons[|0]);
    type = "Boon: "
    Simulation.boon = true;
}
else
{
    ds_list_shuffle(Simulation.curses);
    event = instance_create(0,0,Simulation.curses[|0])
    type = "Curse: "
    Simulation.curse = true;
}

if(event != noone)
{
    log_message(type + event.description);
    with(event){instance_destroy()}
    ga_design_event("LoreBox:Opened");
}



