/// @description color_adjust_brightness(color, brightness_multiplier);
/// @param color
/// @param  brightness_multiplier
{
    return make_colour_hsv(colour_get_hue(argument0), colour_get_saturation(argument0), clamp(colour_get_value(argument0) * argument1, 0, 255));
}
