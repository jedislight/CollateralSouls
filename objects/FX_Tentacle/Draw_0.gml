var grid_size = Renderer.grid_size
var sx = (x+.5)*grid_size
var sy = (y+.5)*grid_size
var fx = lerp(sx, (tx+.5)*grid_size, lerp_amount)
var fy = lerp(sy, (ty+.5)*grid_size, lerp_amount)
var smoothness = 0.32
draw_set_blend_mode(bm_add);
draw_bezier(sx, sy, lerp(sx,fx,.25)+off_x2, lerp(sy,fy,.75)+off_y2,lerp(sx,fx,.25)+off_x3, lerp(sy,fy,.75)+off_y3,fx+off_x4, fy+off_y4,smoothness, width * 5, color_end, color_start);
//draw_bezier(sx, sy, lerp(sx,fx,.25)+off_x2, lerp(sy,fy,.75)+off_y2,lerp(sx,fx,.25)+off_x3, lerp(sy,fy,.75)+off_y3,fx+off_x4, fy+off_y4,smoothness, 4, color_start, color_end);
//draw_bezier(sx, sy, lerp(sx,fx,.25)+off_x2, lerp(sy,fy,.75)+off_y2,lerp(sx,fx,.25)+off_x3, lerp(sy,fy,.75)+off_y3,fx+off_x4, fy+off_y4,smoothness, 3, color_end, color_start);
draw_bezier(sx, sy, lerp(sx,fx,.25)+off_x2, lerp(sy,fy,.75)+off_y2,lerp(sx,fx,.25)+off_x3, lerp(sy,fy,.75)+off_y3,fx+off_x4, fy+off_y4,smoothness, width * 2, color_start, color_end);
//draw_bezier(sx, sy, lerp(sx,fx,.25)+off_x2, lerp(sy,fy,.75)+off_y2,lerp(sx,fx,.25)+off_x3, lerp(sy,fy,.75)+off_y3,fx+off_x4, fy+off_y4,smoothness, 1, color_end, color_start);
/*
draw_line_width_colour(sx, sy, fx, fy, 5, color_end, color_start);
draw_line_width_colour(sx, sy, fx, fy, 4, color_start, color_end);
draw_line_width_colour(sx, sy, fx, fy, 3, color_end, color_start);
draw_line_width_colour(sx, sy, fx, fy, 2, color_start, color_start);
draw_line_width_colour(sx, sy, fx, fy, 1, color_end, color_start);
*/
draw_set_blend_mode(bm_normal);

/* */
/*  */
