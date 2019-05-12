{
    var text = "";
    text += "#New user hints"
    text += "# - Creatures have access to the same perks you do"
    text += "# - '?' are Lore Boxes, pick them up to get insight into the world, open them for a chance at a helpful boon or a terrible curse"
    text += "# - You regenerate some health every time you make it to the next floor"
    text += "# - Play smart - there are no fights you will win by having better statistics"
    text += "#"
    text += "#Numberpad Movement(Recommended)"
    text += "#\\  |  /"
    text += "# 7 8 9"
    text += "#-4   6-"
    text += "# 1 2 3"
    text += "#/  |  \\ "
    text += "#"
    if(Config.reals[?"vi_keyboard"])
    {
        text += "#Letter Movement"
        text += "#\\  |  /"
        text += "# Y K U"
        text += "#-H   L-"
        text += "# B J N"
        text += "#/  |  \\ "
        text += "#"
        text += "#Numberpad 5 or G - Wait, Use"
    }
    else
    {
        text += "#Letter Movement"
        text += "#\\  |  /"
        text += "# Y U I"
        text += "#-H   K-"
        text += "# N M ,"
        text += "#/  |  \\ "
        text += "#"    
        text += "#Numberpad 5 or J - Wait, Use"
    }
    text += "#Numberpad 0 or Space - Ranged Attack, or Next Target"
    text += "#Numberpad + or Tab- Next Target"
    text += "#Numberpad - or Shift+Tab Previous Target"
    text += "#"
    text += "#Return or Enter - Confirm Menu Item"
    text += "#C - Open Character Sheet"
    text += "#Esc - Open Game Menu"
    text += "#"
    var help = new_menu("Help", text);
    var close_item = new_menu_item(help, Menu_Item_Close, "Close Help" , "");
    close_item.shortcut = 191;
}
