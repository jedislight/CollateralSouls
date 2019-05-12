/// @description new_menu(title, text)
/// @param title
/// @param  text
{
    var title = argument0;
    var text = argument1;
    var menu = instance_create(0,0, Menu);
    menu.title = title;
    menu.text = text;
    ds_list_add(Simulation.menu_system.menu_stack, menu);
    return menu;
}
