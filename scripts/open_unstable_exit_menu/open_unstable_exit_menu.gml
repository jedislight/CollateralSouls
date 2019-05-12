/// @description open_unstable_exit_menu()
{   
    var menu = new_menu("An Unstable Portal", "");
    menu.text = "This unstable portal goes to a much darker realm, emitting malice like heat from a fire"         
    new_menu_item(menu, Menu_Item_Close, "Walk Away" , "");
    new_menu_item(menu, Menu_Item_Unstable_Portal, "Descend Into Madness" , "");
}
