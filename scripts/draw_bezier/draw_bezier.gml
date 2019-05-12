/// @description draw_bezier(x1,y1,x2,y2,x3,y3,x4,y4, line_smoothness, line_thickness, color_start, color_end)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param  line_smoothness
/// @param  line_thickness
/// @param  color_start
/// @param  color_end
/*
Name: draw_bezier
Original Author: roach
Modifications by: Jedislight
---
Arguments:
argument0 - x1
argument1 - y1
argument2 - x2
argument3 - y2
argument4 - x3
argument5 - y3
argument6 - x4
argument7 - y4
argument8 - Line smoothness
---
Example:
draw_bezier(0,0,640,0,0,480,640,480,0.005);
*/
i=0
ox=argument0
oy=argument1
cx=3*(argument2-argument0)
bx=3*(argument4-argument2)-cx
ax=argument6-argument0-cx-bx
cy=3*(argument3-argument1)
by=3*(argument5-argument3)-cy
ay=argument7-argument1-cy-by
for (i=0; i<1; i+=argument8)
{
  xq=((ax*i+bx)*i+cx)*i+argument0
  yq=((ay*i+by)*i+cy)*i+argument1
  if i>0 {draw_line_width_colour(ox,oy,xq,yq, argument9, argument10, argument11)}
  ox=xq; oy=yq
}
