var grid_size = Renderer.grid_size
draw_set_blend_mode(bm_add);
repeat(3)
{
    draw_set_alpha(ttl * 0.1);
    var sx = (tx+.5)*grid_size;
    var sy = (ty+.5)*grid_size-grid_size*4
    var fx = (tx+.5)*grid_size
    var fy = (ty+.5)*grid_size
    var mid_y = ( fy + sy ) / 2;
    var mid_off_x = random_range(-grid_size, grid_size) + fx;
    var fx = random_range(-grid_size, grid_size) + fx;
    var color_mid = merge_colour(color_start, color_end, 0.5);
    draw_line_width_colour(sx, sy, mid_off_x, mid_y, 3, color_start, color_mid);
    draw_line_width_colour(mid_off_x, mid_y, fx, fy, 2, color_mid, color_end);
    draw_line_width_colour(mid_off_x, mid_y, fx+random_range(-grid_size, grid_size), fy, width, color_mid, color_end);
    draw_set_alpha(1.0);
}
draw_set_blend_mode(bm_normal);

