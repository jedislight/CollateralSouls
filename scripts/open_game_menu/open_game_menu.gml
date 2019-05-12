/// @description open_game_menu()
{   
    var menu = new_menu("Collateral Souls", "");         
    new_menu_item(menu, Menu_Item_Close, "Return to game" , "");    
    if(instance_number(Condition) > 0)
    {
        new_menu_item(menu, Menu_Item_Open_Conditions_Menu, "View Active Challenges" , "");        
    }
    
    new_menu_item(menu, Menu_Item_Divider, "", "");
    
    new_menu_item(menu, Menu_Item_Open_Settings, "Settings" , "");
	if (DEBUG)
	{
		new_menu_item(menu, Menu_Item_Open_Debug_Menu, "Debug Options" , "");     	
	}
    new_menu_item(menu, Menu_Item_Open_Help, "View Help" , "");     
    new_menu_item(menu, Menu_Item_Open_Perk_Help, "Perk Guide" , "");     
    new_menu_item(menu, Menu_Item_Bug_Report, "Report Bug" , "https://procrastinationsoftworks.atlassian.net/servicedesk/customer/portal/1");         
    new_menu_item(menu, Menu_Item_Exit_Game, "Exit game" , "");                    
    menu.default_item_index = 0;
}
