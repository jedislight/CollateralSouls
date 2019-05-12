{
    var text = "";
    var menu = new_menu("Perk Guide", text);    
    
    for(var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        var perk = instance_create(0,0, Simulation.perks[|i]);

        if(ds_list_find_index(perk.required, Perk_Unobtainable) < 0)
        {
            var perk_item = new_menu_item(menu, Menu_Item_Open_Perk_Help_For, perk.name, "");                
            perk_item.perk_index = Simulation.perks[|i]
        }
        with(perk){instance_destroy()}
    }
    
    for(var e = ds_list_size(menu.menu_items)-1; e >= 0; --e)
    {
        for(s = 0; s < e; ++s)
        {
            if(menu.menu_items[|s].text > menu.menu_items[|s+1].text)
            {
                var temp = menu.menu_items[|s];
                menu.menu_items[|s] = menu.menu_items[|s+1];
                menu.menu_items[|s+1] = temp;
            }
        }
    }
    
    menu.text = text;                  
    new_menu_item(menu, Menu_Item_Divider, "" , "");          
    var close_item = new_menu_item(menu, Menu_Item_Close, "Close" , "");          
}
