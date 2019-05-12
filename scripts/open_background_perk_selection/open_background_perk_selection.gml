{
    var backgrounds = new_menu("Background Selection", "Choose a background perk");
    
    new_menu_item(backgrounds, Menu_Item_Divider, "-Standard-", ""); 
    new_perk_menu_item(backgrounds, Perk_Background_Forgotton );

    new_menu_item(backgrounds, Menu_Item_Divider, "", "");     
    new_menu_item(backgrounds, Menu_Item_Divider, "-Healing-", ""); 
    new_perk_menu_item(backgrounds, Perk_Background_Seeker );
    new_perk_menu_item(backgrounds, Perk_Background_Sadist );

    new_menu_item(backgrounds, Menu_Item_Divider, "", "");     
    new_menu_item(backgrounds, Menu_Item_Divider, "-Alignment-", ""); 
    new_perk_menu_item(backgrounds, Perk_Background_Saint );
    new_perk_menu_item(backgrounds, Perk_Background_Sinner );
    
    new_menu_item(backgrounds, Menu_Item_Divider, "", "");     
    new_menu_item(backgrounds, Menu_Item_Divider, "-Perks-", ""); 
    new_perk_menu_item(backgrounds, Perk_Background_Scholar );
    new_perk_menu_item(backgrounds, Perk_Background_Simple );
    
    new_menu_item(backgrounds, Menu_Item_Divider, "", "");     
    new_menu_item(backgrounds, Menu_Item_Divider, "-Affinity-", "");     
    new_perk_menu_item(backgrounds, Perk_Background_Survivor );
    new_perk_menu_item(backgrounds, Perk_Background_Slayer );
    
    new_menu_item(backgrounds, Menu_Item_Divider, "", "");     
    new_menu_item(backgrounds, Menu_Item_Divider, "-Other-", "");     
    new_perk_menu_item(backgrounds, Perk_Background_Switch );
    
    backgrounds.selected_index = 1;
    backgrounds.default_item_index = 1;
}
