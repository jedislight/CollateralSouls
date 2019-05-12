/// @description new_menu_item(menu, menu_item, text, detail)
/// @param menu
/// @param  menu_item
/// @param  text
/// @param  detail
{
    var menu = argument0;
    if(instance_exists(menu))
    {
        var menu_item = instance_create(0,0,argument1);
        if(is_string(argument2))
        {
            menu_item.text = argument2;
        }
        if(is_string(argument3))
        {
            menu_item.detail = argument3;
        }
        ds_list_add(menu.menu_items, menu_item);
        return menu_item;
    }
    return noone;
}
