/// @description open_challenge_menu();
{
    var text = "";
    with(Condition)
    {
        text += "#" + name + " - " + description;
    }
    var menu = new_menu("Challenge Settings", text);
    new_menu_item(menu, Menu_Item_Close, "Back" , "");
}
