/// @description new_perk_menu_item(menu, perk)
/// @param menu
/// @param  perk
{
    var menu = argument0;
    var perk = argument1;
    var player = instance_find(Player, 0);
    var p = new_perk(perk, player);
    var menu_item = new_menu_item(menu, Menu_Item_Grant_Perk, p.name, p.detail);
    menu_item.perk = perk;
    with(p){instance_destroy()}
}
