/// @description color_add_noise(color, noise)
/// @param color
/// @param  noise
{
    var color = argument0;
    var noise = argument1;
    var r = colour_get_red(color);
    var g = colour_get_green(color);
    var b = colour_get_blue(color);
 
    r += irandom_range(-noise, noise);
    g += irandom_range(-noise, noise);
    b += irandom_range(-noise, noise);
    
    r = clamp(r, 0, 255);
    g = clamp(g, 0, 255);
    b = clamp(b, 0, 255);
    
    return make_colour_rgb(r,g,b);   
}
