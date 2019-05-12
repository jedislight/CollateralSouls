/// @description open_character_sheet
{
    show_debug_message("open character sheet");
    var object = argument0;   
    var fighter = object.fighter;
    var text = "";
    text += "#--General--"
    text += "#Level: " + string(fighter.level)
    if(fighter.next_level < 1000)
    {
        text += "#XP: " + string(fighter.xp) + " / " + string(fighter.next_level)
    }
    text += "#"
    text += "#--Defense--"
    text += "#HP: " + string(fighter.hp) + " / " + string(fighter.hp_max)
    text += "#Armor: " + string(round(fighter.armor * 100)) + "%"
    text += "#"
    text += "#--Melee--"
    text += "#Accuracy: +" + string(round(fighter.accuracy*100)) + "%"
    text += "#Damage: " + string(fighter.damage)
    text += "#"
    text += "#--Ranged--"
    text += "#Accuracy: +" + string(round(fighter.ranged_accuracy*100)) + "%"
    text += "#Damage: " + string(fighter.ranged_damage)
    text += "#Optimal Range: " + string(fighter.ranged_distance_min) +"m - " + string(fighter.ranged_distance_max) + "m"
    text += "#"
    text += "#--Perks--"
    
    var sheet = new_menu(object.name, text);
    
    var perk_count = 0;
    var close_set = false;
    for(var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        var perk = perk_get(object, Simulation.perks[|i]);
        if(instance_exists(perk))
        {
            ++perk_count;
            var name_decoration = "";
            if(perk.temporary)
            {
                name_decoration += "(Temporary)";
            }
            var perk_item = new_menu_item(sheet, Menu_Item_Close, perk.name + name_decoration, perk.detail);                
            if(close_set == false) // only shortcut first perk, so all don't fire at once
            {
                perk_item.shortcut = "C"; 
                close_set = true;
            }
        }
    }
    if(perk_count == 0)
    {
        var close_item = new_menu_item(sheet, Menu_Item_Close, "<No Perks>" , "");                    
        close_item.shortcut = "C";
    }   
}
