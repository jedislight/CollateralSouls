{
    var text = "";
    var debug_menu = new_menu("Debug Menu", text);
    
    new_menu_item(debug_menu, Menu_Item_Divider, "-Audio Mixer-", "");
	new_menu_item(debug_menu, Menu_Item_Config_Debug_Selected_Mix_Track, noone , noone);
    new_menu_item(debug_menu, Menu_Item_Config_Gain, noone , noone);
    
    new_menu_item(debug_menu, Menu_Item_Divider, "", "");
    new_menu_item(debug_menu, Menu_Item_Close, "Return" , "");
    
    debug_menu.selected_index = 1;//put selection after divider
}
