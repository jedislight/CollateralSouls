/// @description draw_status_indicator(x, y, text, color);
/// @param x
/// @param  y
/// @param  text
/// @param  color
{
    var xx = argument0;
    var yy = argument1;
    var text = string_center(argument2, 20);
    var color = argument3;
    var width = string_width(string_hash_to_newline(text));
    var height = string_height(string_hash_to_newline(text));
    var color_a = color_adjust_brightness(color_get_analogous_a(color), 0.25);
    var color_b = color_adjust_brightness(color_get_analogous_b(color), 0.25);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_roundrect_colour(xx-1, yy, xx + width, yy + height, color_a, color_b, false);
    draw_text_colour(xx+1, yy, string_hash_to_newline(text), color, color, color, color, 1.0);
    return height;
}
