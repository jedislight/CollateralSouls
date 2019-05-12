var sx = origin_x + lengthdir_x(total_distance * lerp_end - 10, direction);
var sy = origin_y + lengthdir_y(total_distance * lerp_end - 10, direction);
var fx = origin_x + lengthdir_x(total_distance * lerp_end, direction);
var fy = origin_y + lengthdir_y(total_distance * lerp_end, direction);
draw_line_width_colour(sx, sy, fx, fy, 1.5, merge_colour(color_start, color_end, lerp_start), merge_colour(color_start, color_end, lerp_end));
var sx = origin_x + lengthdir_x(total_distance * lerp_end - 15, direction);
var sy = origin_y + lengthdir_y(total_distance * lerp_end - 15, direction);
var fx = sx
var fy = sy
draw_set_alpha(0.3);
draw_line_width_colour(sx, sy, fx, fy, 1.5, merge_colour(color_start, color_end, lerp_start), merge_colour(color_start, color_end, lerp_end));
draw_set_alpha(1.0);

