/// @description open_character_sheet
{
    var perk_index = argument0;   
    var text = "";
    var menu = new_menu("Perk Guide", text);    
    
    var perk = instance_create(0,0,perk_index);
    text += "#--"+perk.name+"--"        
    text += "#"+perk.detail;
    

    new_menu_item(menu, Menu_Item_Divider, "" , "");        
    new_menu_item(menu, Menu_Item_Divider, "--Requires--" , "");
    for(var i = 0; i < ds_list_size(perk.required); ++i)
    {
        var item = new_menu_item(menu, Menu_Item_Open_Perk_Help_For, perk_name_from_index(perk.required[|i]) , "");
        item.perk_index = perk.required[|i];
    }

    new_menu_item(menu, Menu_Item_Divider, "" , "");                
    new_menu_item(menu, Menu_Item_Divider, "--Requires One Of--" , "");
    for(var i = 0; i < ds_list_size(perk.any); ++i)
    {
        var item = new_menu_item(menu, Menu_Item_Open_Perk_Help_For, perk_name_from_index(perk.any[|i]) , "");
        item.perk_index = perk.any[|i];
    }

    new_menu_item(menu, Menu_Item_Divider, "" , "");                
    new_menu_item(menu, Menu_Item_Divider, "--Excluded By--" , "");
    for(var i = 0; i < ds_list_size(perk.exclusive); ++i)
    {
        var item = new_menu_item(menu, Menu_Item_Open_Perk_Help_For, perk_name_from_index(perk.exclusive[|i]) , "");
        item.perk_index = perk.exclusive[|i];
    }

    new_menu_item(menu, Menu_Item_Divider, "" , "");        
    new_menu_item(menu, Menu_Item_Divider, "--Leads To--" , "");
    for(var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        var p = instance_create(0,0, Simulation.perks[|i]);
        if(ds_list_find_index(p.required, perk.object_index) >= 0 or ds_list_find_index(p.any, perk.object_index) >= 0)
        {
            var item = new_menu_item(menu, Menu_Item_Open_Perk_Help_For, perk_name_from_index(Simulation.perks[|i]) , "");
            item.perk_index = Simulation.perks[|i];
        }
        with(p){instance_destroy()}
    }
    with(perk){instance_destroy()}
    
    menu.text = text;
    
    new_menu_item(menu, Menu_Item_Divider, "" , "");   
    new_menu_item(menu, Menu_Item_Divider, "" , "");   
    var back_item = new_menu_item(menu, Menu_Item_Close, "Back" , "");                    
    var close_item = new_menu_item(menu, Menu_Item_Close_Perk_Help, "Close" , "");          
    
    menu_cycle(menu, 1);
}
