pop_active_menu()
var menu = instance_create(0,0, Start_Challenge_Menu);
ds_list_add(Simulation.menu_system.menu_stack, menu);
var menu_item = new_menu_item(menu, Menu_Item_Close, "Continue", "");

