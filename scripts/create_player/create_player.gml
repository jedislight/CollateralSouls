{
    var count = instance_number(Floor);
    //show_debug_message("floor count:"+ string(count));
    var floor_instance = instance_find(Floor,irandom_range(0,count-1));
    //show_debug_message("floor found:"+ string(floor_instance));
    var player = instance_create(floor_instance.x, floor_instance.y, Player)
    if(instance_number(Actor) == 0)
    {
        var background_condition = condition_get(Condition_Background_Locked);
        if(instance_exists(background_condition))
        {
            perk_grant(player, background_condition.value);
        }
        else
        {
            //menu stack - so add in reverse order
            show_debug_message("perk selection and name entry menus created");
            //background perk menu
            open_background_perk_selection();
        }
        
        show_debug_message("checking for player starts with perk conditions");
        var starts_with = condition_get(Condition_Player_Perk);
        if(instance_exists(starts_with))
        {
            perk_grant(player, starts_with.value);
        }
        show_debug_message("done checking for player starts with perk conditions");
        
        //name menu
        var menu = instance_create(0,0, Start_Game_Menu);
        ds_list_add(Simulation.menu_system.menu_stack, menu);
        var menu_item = new_menu_item(menu, Menu_Item_Close, "Start Game", "");
        
    }
    else
    {
        player.name = actor_get_name();
        perk_grant(player, Perk_Background_Forgotton);
    }
    show_debug_message("create_player complete");
    return player.id;
}
