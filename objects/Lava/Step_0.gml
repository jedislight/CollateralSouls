color = make_colour_hsv(colour_get_hue(base_color), colour_get_saturation(base_color), colour_get_value(base_color) * abs(clamp(sin((current_time*0.005)+(sin(x)+cos(y))*0.5), 0.65, 1.0)));

