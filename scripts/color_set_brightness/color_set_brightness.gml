/// @description color_adjust_brightness(color, brightness);
/// @param color
/// @param  brightness
{
    return make_colour_hsv(colour_get_hue(argument0), colour_get_saturation(argument0), clamp(255 * argument1, 0, 255));
}
