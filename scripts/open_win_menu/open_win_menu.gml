{
    with(Lore_Box)
    {
        instance_destroy();
    }
    var player = instance_find(Player, 0);
    if(instance_exists(player))
    {    
        var menu = new_menu("Lore Box", "#"+ "You pick a box from many. The body you are holding gasps for air, it's breathing labored but steadying. It will wake up soon. You leave your weapon behind for it, a tiny fragment of your essence. With them, your weapon reverts back to a simple one, unable to maintain its previous glory without your influence. You summon up the note you found upon waking, 'Welcome to the Afterlife. You'll need this.' leaving it with them for when they fully awake. You focus your will outwards, projecting on your surroundings. You create a sanctuary for yourself and step out of this prison. A feeling of hope overtakes you: that the others and those you've slain will one day find their own path out, as you did. You have a feeling most never will, but you do not stop to mourn those collateral souls.#");         
        new_menu_item(menu, Menu_Item_Win_Game, "Ascend" , "");
        menu.default_item_index = 0;
        log_history("!", c_white);
    }
}
