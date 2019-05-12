/// @description open_main_menu()
{   
    show_debug_message("OPEN MAIN MENU");
    var menu = new_menu("Collateral Souls", "");        
    
    new_menu_item(menu, Menu_Item_Divider, "-Play-", ""); 
    new_menu_item(menu, Menu_Item_New_Game, "New Game" , "");
    new_menu_item(menu, Menu_Item_Challenge_Game, "Challenge Game" , "");
    new_menu_item(menu, Menu_Item_Challenge_Game_Seeded, "Daily Challenge Game" , "");
    
    new_menu_item(menu, Menu_Item_Divider, "", "");
    new_menu_item(menu, Menu_Item_Divider, "-Config & Info-", ""); 
    new_menu_item(menu, Menu_Item_Open_Settings, "Settings" , "");
    new_menu_item(menu, Menu_Item_Open_Perk_Help, "Perk Guide" , "");
    new_menu_item(menu, Menu_Item_Open_Highscore, "High Scores" , "");                     
    new_menu_item(menu, Menu_Item_Open_Credits, "Credits" , "");    
    
    new_menu_item(menu, Menu_Item_Divider, "", "");
    new_menu_item(menu, Menu_Item_Divider, "-Support-", ""); 
    new_menu_item(menu, Menu_Item_Open_Help, "View Help" , "");  
    new_menu_item(menu, Menu_Item_Bug_Report, "Report Bug" , "https://procrastinationsoftworks.atlassian.net/servicedesk/customer/portal/1");     
    new_menu_item(menu, Menu_Item_Bug_Report, "Suggest Feature" , "https://procrastinationsoftworks.atlassian.net/servicedesk/customer/portal/1");

    new_menu_item(menu, Menu_Item_Divider, "", "");     
    
    new_menu_item(menu, Menu_Item_Exit_Game, "Exit game" , "");                    
    menu.default_item_index = 16;
    menu.selected_index = 1;
    
    if(instance_number(Actor) > 0)
    {
        menu_confirm(menu);
    }
}
