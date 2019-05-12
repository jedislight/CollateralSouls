{
        var player = instance_find(Player,0);
        var fighter = player.fighter;
        var level_up_menu = new_menu("Level Up!", "Please select a perk");
        var available_perks = ds_list_create();
        for (var i = 0; i < ds_list_size(Simulation.perks); ++i)
        {
            if(perk_is_available(fighter.owner, Simulation.perks[|i]))
            {
                ds_list_add(available_perks, Simulation.perks[|i]);
            }
        }
        ds_list_shuffle(available_perks);
        var considered = 4;
        if(perk_exists(fighter.owner, Perk_Open_Minded))
        {
            considered += perk_get(fighter.owner, Perk_Open_Minded).value;
        }
        if(perk_exists(fighter.owner, Perk_Background_Sinner) or perk_exists(fighter.owner, Perk_Background_Saint))
        {
            considered += 2;
        }
        for(var i = 0; i < min(considered, ds_list_size(available_perks)); ++i)
        {
            new_perk_menu_item(level_up_menu, available_perks[|i]);
        }

        if(ds_list_size(available_perks) != 0)
        {
            new_menu_item(level_up_menu, Menu_Item_Divider, "", "");
        }
        new_menu_item(level_up_menu, Menu_Item_Full_Heal, "Full Heal", "Instantly restore all lost health. No long term effect. May be taken multiple times.");
        if(instance_number(Actor) == 0)
        {
            new_menu_item(level_up_menu, Menu_Item_Divider, "", "");
            new_menu_item(level_up_menu, Menu_Item_Open_Character_Sheet, "Open Character Sheet", "");
        }
        
        if(perk_exists(fighter.owner, Perk_Background_Scholar) and (considered < min(considered*2, ds_list_size(available_perks))))
        {
            var scholar_menu = new_menu("Scholar Perk!", "Please select a perk");
            for(var i = considered; i < min(considered*2, ds_list_size(available_perks)); ++i)
            {
                new_perk_menu_item(scholar_menu, available_perks[|i]);
            }
            if(instance_number(Actor) == 0)
            {
                new_menu_item(scholar_menu, Menu_Item_Divider, "", "");
                new_menu_item(scholar_menu, Menu_Item_Open_Character_Sheet, "Open Character Sheet", "");
            }
        }
        ds_list_destroy(available_perks);
}
