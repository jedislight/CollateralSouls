/// @description color_get_hue_offset(input_color, hue_offset);
/// @param input_color
/// @param  hue_offset
{
    var in = argument0;
    var offset = argument1;
    
    return make_colour_hsv((colour_get_hue(in)+offset) mod 255, colour_get_saturation(in), colour_get_value(in));
}
