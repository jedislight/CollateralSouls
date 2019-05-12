/// @description open_highscore_menu([added_player_name, add_default_close_menu_item, added_player_score]);
/// @param [added_player_name
/// @param  add_default_close_menu_item
/// @param  added_player_score]
{
    var current = ""
    if(argument_count>0)
    {
        current = argument[0];
    }
    var c_score = 0;
    if(argument_count > 2)
    {
        c_score = argument[2];
    }
    var scores_text = "";
    for(var i = 1; i <= 10; ++i)
    {
        var name = highscore_name(i);
        var points = highscore_value(i);
        var display_name = string_copy(name, 1, min(string_length(name), 15));
        var display_name_length = string_length(display_name);
        var spaces = 20 - display_name_length;
        display_name += string_repeat(" ", spaces);;
        var line = "#" + display_name + string(points);
        scores_text += line;
        if(name == current and (c_score != 0 and points == c_score))
        {
            scores_text += "*"
        }
    }
    scores_text += "#"
    var scores = new_menu("Best Afterlives", scores_text);
    var default_close_button = true;
    if(argument_count>1)
    {
        default_close_button = argument[1];
    }
    if(default_close_button)
    {
        new_menu_item(scores, Menu_Item_Close, "Close" , "");
    }
    return scores;
}
