{
    var text = "";
    var menu = new_menu("Tileset Selection", text);
    
    file = file_find_first("tileset_*.png", 0);
    while (file != "")
    {
        var tileset_name = string_replace_all(string_replace_all(string_replace_all(file, "tileset_", ""), "_", " "), ".png", "");
        var item = new_menu_item(menu, Menu_Item_Select_Tileset, tileset_name, "");
        item.file = file;
        file = file_find_next();
    }

    new_menu_item(menu, Menu_Item_Divider, "" , "");
    new_menu_item(menu, Menu_Item_Close, "Close" , "");
}
