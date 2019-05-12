{
    var text = "";
    var settings_menu = new_menu("Settings", text);
    
    new_menu_item(settings_menu, Menu_Item_Divider, "-Graphics-", "");
    new_menu_item(settings_menu, Menu_Item_Config_Brightness, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Config_Smooth_Rendering, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Config_Full_Screen, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Open_Tileset_Menu, "Change Tileset" , "Change the tileset used in the game");
    
    new_menu_item(settings_menu, Menu_Item_Divider, "", "");
    new_menu_item(settings_menu, Menu_Item_Divider, "-Display-", "");
    new_menu_item(settings_menu, Menu_Item_Config_Draw_FoW, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Config_HP_Bar_Color_Shift, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Config_Show_Bar_Values, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Config_Show_Alerts, noone , noone);

    new_menu_item(settings_menu, Menu_Item_Divider, "", "");    
    new_menu_item(settings_menu, Menu_Item_Divider, "-Gameplay-", "");
    new_menu_item(settings_menu, Menu_Item_Config_Wait_On_FX, noone , noone);
    new_menu_item(settings_menu, Menu_Item_Config_VI_Keyboard, noone , noone);
    
    new_menu_item(settings_menu, Menu_Item_Divider, "", "");    
    new_menu_item(settings_menu, Menu_Item_Divider, "-Compatibility-", "");
    new_menu_item(settings_menu, Menu_Item_Config_Collapse_Event, noone , noone);
    
    new_menu_item(settings_menu, Menu_Item_Divider, "", "");
    new_menu_item(settings_menu, Menu_Item_Close, "Close Settings" , "");
    
    settings_menu.selected_index = 1;//put selection after divider
}
