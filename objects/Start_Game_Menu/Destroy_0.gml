var player = instance_find(Player,0);
if(instance_exists(player))
{
    player.name = text;
    Config.strings[?"last_used_name"] = player.name;
    config_save();
}
while(!ds_list_empty(menu_items))
{
    with(menu_items[|0]){instance_destroy()};
    ds_list_delete(menu_items, 0);
}

log_clear();
log_message(text + " wakes up with a pistol in their hand. A note wrapped around the barrel - 'Welcome to the afterlife, you'll need this'##Press ? or at any time Ctrl+H to see user guide for controls and tips.");


