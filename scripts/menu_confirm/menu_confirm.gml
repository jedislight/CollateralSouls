/// @description menu_confirm(menu)
/// @param menu
{
    var menu = argument0;
    //menu_cycle(menu, 0);
    var menu_item = menu.menu_items[| menu.selected_index];
    with(menu_item){event_user(EVENT_MENU_ITEM_CONFIM)};
}
