/// @description menu_cycle(menu, value)
/// @param menu
/// @param  value
{
    var menu = argument0;
    var value = argument1;
    var size = ds_list_size(menu.menu_items);
    if(size == 0)
    {
        return false;
    }
    
    menu.selected_index += value;
    
    while(menu.selected_index < 0)
    {
        menu.selected_index += size;
    }
    
    while(menu.selected_index >= size)
    {
        menu.selected_index -= size;
    }
    
    if(menu.menu_items[|menu.selected_index].object_index == Menu_Item_Divider)
    {
        menu_cycle(argument0, argument1);
    }
}
