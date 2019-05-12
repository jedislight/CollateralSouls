draw_set_font(Courier_New)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(color)
if(not text_only)
{
    draw_set_alpha(.75 + .15-ttl*.01)
    draw_circle(x, y-1, 0.5*max(string_height(string_hash_to_newline(text)), string_width(string_hash_to_newline(text))), false);
    draw_set_alpha(1.0)
}

var text_color = color;
if(not text_only)
{
    text_color = c_black;   
}
draw_text_colour(x, y, string_hash_to_newline(text), text_color, text_color, text_color, text_color, 1.0);

