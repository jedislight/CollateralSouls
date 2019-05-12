/// @description log_history(character, color);
/// @param character
/// @param  color
{
    var player = instance_find(Player, 0);
    if(instance_exists(player))
    {
        ds_list_add(player.history, argument0);
        ds_list_add(player.color_history, argument1);
    }
}
