draw_set_alpha(0.5);
repeat(max(1,16-radius))
{
    var target_x = choose(1,-1)*random_range(0, radius) + origin_x;
    var target_y = choose(1,-1)*random_range(0, radius) + origin_y;
    draw_line_width_colour(origin_x, origin_y, target_x, target_y, point_distance(target_x,target_y,origin_x,origin_y)/4, color_start, color_end);
}
draw_set_alpha(1.0);

