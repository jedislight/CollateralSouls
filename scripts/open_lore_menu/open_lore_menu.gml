{
    with(Lore_Box)
    {
        instance_destroy();
    }
    var player = instance_find(Player, 0);
    if(instance_exists(player))
    {    
        var menu = new_menu("Lore Box", "#"+lore_pick_by_floor(player.floors_covered));         
        new_menu_item(menu, Menu_Item_Open_Lore_Box, "Yes" , "");
        new_menu_item(menu, Menu_Item_Do_Not_Open_Lore_Box, "No" , "");    
        menu.default_item_index = 0;
        log_history("?", c_white);
        player.lore_boxes_found += 1;
    }
}
