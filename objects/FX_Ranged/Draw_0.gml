if(delay < 0)
{   
    draw_set_alpha(ttl * 0.15);
    draw_line_width_colour(origin_x, origin_y, target_x, target_y, width, merge_colour(color_start, color_end, lerp_start), merge_colour(color_start, color_end, lerp_end));
    draw_set_alpha(1.0);
}

