var player = instance_find(Player, 0);
if(instance_exists(player))
{ 
    text = player.name
    text += "#Level: "+string(player.fighter.level);
    text += "#Floor: "+string(player.floors_covered);
    text += "#Turn: " + string(player.turns_taken);
    text += "#"
    text += "#C : Character Sheet"
    text += "#Esc: Game Menu"
    text += "#+/-/Tab : Cycle Target"
    text += "#0/Space : Ranged Attack"
    if(perk_exists(player, Perk_Insightfull))
    {
        text += "#Shift+C: Target Sheet"
    }
    else
    {
        text += "#"
    }

    usable = is_useable(player.x, player.y);
    if(instance_exists(usable))
    {
        text += "#5,J : " + usable.description
    }
    else
    {
        text += "# "
    }
    draw_set_font(Courier_New);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_text(x,y, string_hash_to_newline(text));
    var cursor = y - string_height(string_hash_to_newline(text)) - font_get_size(Courier_New)*2+4;
    
    var daylight = instance_number(Daylight);
    var boon = Simulation.boon;
    var curse = Simulation.curse;
    var off_color = color_adjust_brightness(c_dkgray, 0.25);
    var daylight_color = color_set_brightness(c_white, 0.5);
    var boon_color = color_set_brightness(c_aqua, 0.5);
    var curse_color = color_set_brightness(c_purple, 0.5);
    var curse_text = "cursed"
    var boon_text = "boon"
    var daylight_text = "daylight"
    
    if(not daylight)
    {
        daylight_color = off_color;
    }
    if(not boon)
    {
        boon_color = off_color;
    }
    if(not curse)
    {
        curse_color = off_color;
    }
    var called_shots_text = "called shot";
    var called_shots_color = off_color;
    var called_shot = false;
    if(perk_exists(player, Perk_Called_Shots))
    {
        var target = Simulation.targeting.target;
        if(instance_exists(target) and get_cover(player, target) == 1.0)
        {
            called_shots_color = c_yellow;   
        }
    }
    
    var beserker_text = "berserker";
    var beserker_color = off_color;
    if(perk_exists(player, Perk_Beserker))
    {
        var beserker_perk = perk_get(player, Perk_Beserker);
        var turns_since_damaged = player.turns_taken - player.fighter.last_hit_taken_on - 1;
        var bonus = max(0.0, beserker_perk.value - beserker_perk.falloff * turns_since_damaged);
        if(bonus > 0)
        {
            beserker_text += " +" + string(round(bonus*100))+"%";
            beserker_color = make_colour_hsv( colour_get_hue(c_red), colour_get_saturation(c_red), colour_get_value(500*bonus));
        }
    }
    
    var first_aid_text = "first aid";
    var first_aid_color = off_color;
    if(perk_exists(player, Perk_First_Aid))
    {
        var heal = player.fighter.last_hit_taken * perk_get(player, Perk_First_Aid).value;
        if(heal != 0)
        {
            first_aid_text += "("+string(ceil(heal))+")";
            first_aid_color = c_lime;
        }
    }
    
    var init_color = off_color;
    var init_text = "initiative";
    if(perk_exists(player, Perk_Initiative))
    {
        var init_perk = perk_get(player, Perk_Initiative);
        var turns_since_damaged = player.turns_taken - player.fighter.last_hit_taken_on - 1;
        var bonus = min(init_perk.value, init_perk.falloff * turns_since_damaged);
        if(bonus != 0)
        {
            init_color = c_orange;
            init_text += " -"+string(round(bonus*100))+"%";
        }
    }
    
    var stone_body_color = off_color
    var stone_body_text = "stone body";
    if(perk_exists(player, Perk_Stone_Body_Ritual))
    {
        var stone_body_perk = perk_get(player, Perk_Stone_Body_Ritual);
        if(stone_body_perk.active)
        {
            stone_body_text += "("+string(stone_body_perk.remaining)+")"
            stone_body_color = make_colour_rgb(139,141,122);
        }   
    }
    
    var inferno_color = off_color
    var inferno_text = "inferno rounds";
    if(perk_exists(player, Perk_Inferno_Rounds_Ritual))
    {
        var inferno_perk = perk_get(player, Perk_Inferno_Rounds_Ritual);
        if(inferno_perk.active)
        {
            inferno_text += "("+string(inferno_perk.remaining)+")"
            inferno_color = color_adjust_brightness(make_colour_rgb(96, 20, 17), 1.5);
        }   
    }
    
    var flesh_color = off_color
    var flesh_text = "flesh guise";
    if(perk_exists(player, Perk_Flesh_Guise_Ritual))
    {
        var flesh_perk = perk_get(player, Perk_Flesh_Guise_Ritual);
        if(flesh_perk.ready)
        {
            flesh_text += "(ready)"
            flesh_color = color_adjust_brightness(off_color, 4.0);            
        }
        else if(flesh_perk.active)
        {
            flesh_text += "("+string(flesh_perk.remaining)+")"
            flesh_color = make_colour_rgb(211,175,142);
        }   
    }
    
    var teleport_color = off_color
    var teleport_text = "teleport";
    if(perk_exists(player, Perk_Teleport_Ritual))
    {
        var teleport_perk = perk_get(player, Perk_Teleport_Ritual);
        if(teleport_perk.active)
        {
            teleport_text += "("+string(teleport_perk.remaining)+")"
            teleport_color = color_adjust_brightness(make_colour_rgb(34,29,81), 3.0);
        }   
    }
    
    if(curse)
    {
        cursor -= draw_status_indicator(x, cursor, curse_text, curse_color);
    }
    if(boon)
    {
        cursor -= draw_status_indicator(x, cursor, boon_text, boon_color);
    }
    if(daylight)
    {
        cursor -= draw_status_indicator(x, cursor, daylight_text, daylight_color);
    }
    if(perk_exists(player, Perk_Called_Shots))
    {
        cursor -= draw_status_indicator(x, cursor, called_shots_text, called_shots_color);
    }
    if(perk_exists(player, Perk_Beserker))
    {
        cursor -= draw_status_indicator(x, cursor, beserker_text, beserker_color);
    }
    if(perk_exists(player, Perk_First_Aid))
    {
        cursor -= draw_status_indicator(x, cursor, first_aid_text, first_aid_color);
    }
    if(perk_exists(player, Perk_Initiative))
    {
        cursor -= draw_status_indicator(x, cursor, init_text, init_color);    
    }
    if(perk_exists(player, Perk_Stone_Body_Ritual))
    {
        cursor -= draw_status_indicator(x, cursor, stone_body_text, stone_body_color);  
    }
    if(perk_exists(player, Perk_Inferno_Rounds_Ritual))
    {
        cursor -= draw_status_indicator(x, cursor, inferno_text, inferno_color);  
    }
    if(perk_exists(player, Perk_Flesh_Guise_Ritual))
    {
        cursor -= draw_status_indicator(x, cursor, flesh_text, flesh_color);  
    }
    if(perk_exists(player, Perk_Teleport_Ritual))
    {
        cursor -= draw_status_indicator(x, cursor, teleport_text, teleport_color);  
    }
}

