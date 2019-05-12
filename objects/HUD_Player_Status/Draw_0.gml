player = instance_find(Player,0);
if(player != noone)
{
    var fighter = player.fighter
    var percent_hp = (fighter.hp / fighter.hp_max);
    var percent_xp = ((fighter.xp-fighter.prev_level) / (fighter.next_level-fighter.prev_level));
    var bars_max = 19;
    var hp_pips = ceil(percent_hp * bars_max);
    var xp_pips = floor(percent_xp * bars_max);
    var hp_info = string(ceil(fighter.hp)) + "/" + string(ceil(fighter.hp_max));
    var xp_info = string(floor(fighter.xp)) + "/" + string(ceil(fighter.next_level));
    if(not Config.reals[?"show_bar_values"])
    {
        hp_info = "";
        xp_info = "";
    }
    draw_set_font(Courier_New)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1.0);

    var hp_bar = make_hud_bar("HP", hp_pips, bars_max, hp_info);
    var xp_bar = make_hud_bar("XP", xp_pips, bars_max, xp_info);
    hp_bar_color = c_lime;
    if(Config.reals[?"HP_Bar_Color_Shift"])
    {
        hp_bar_color = merge_colour(c_red, c_lime, sqr(percent_hp));
    }
    draw_set_color(hp_bar_color);
    draw_text(x,y, string_hash_to_newline(hp_bar));
    
    draw_set_color(c_yellow);
    draw_text(x,y+48, string_hash_to_newline(xp_bar));
}

