/// @description EVENT_MENU_ITEM_CONFIM
var player = instance_find(Player,0);
if(instance_exists(player))
{
    perk_grant(player, perk);
    ga_design_event("player:perk_gained:"+ object_get_name(perk));
}
pop_active_menu();

