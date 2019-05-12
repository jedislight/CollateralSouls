{   
    var theme_scripts;
    var index = 0;
    var player = instance_find(Player,0);
    repeat(6){theme_scripts[index++] = paint_dungeon_theme;}
    repeat(4){theme_scripts[index++] = paint_nature_theme;}
    repeat(4){theme_scripts[index++] = paint_mountain_theme;}
    repeat(4){theme_scripts[index++] = paint_swamp_theme;}
    
    if((instance_exists(player) and player.floors_covered > 5) or condition_exists(Condition_Uniformity))
    {
        repeat(4){theme_scripts[index++] = paint_cavern_theme;}
    }
    else
    {
        show_debug_message("Couldn't find player to limit decoration types");
    }
    
    repeat(4){theme_scripts[index++] = paint_volcano_theme;}
    var theme_script = theme_scripts[irandom_range(0, index - 1)];
    var uniformity = condition_get(Condition_Uniformity);
    if(instance_exists(uniformity))
    {
        theme_script = theme_scripts[uniformity.value mod index];
    }
    show_debug_message(script_get_name(theme_script));
    script_execute(theme_script);
    
    if(condition_exists(Condition_Ambience))
    {
        instance_create(0,0,Daylight);
        with(Lamp){instance_destroy()};
    }
    if(condition_exists(Condition_Darkness))
    {
        with(Lamp){instance_destroy()};
    }
}
