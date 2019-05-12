ttl -= 1;
if(ttl <= 0)
{
    instance_destroy();
}

var grid_size = Renderer.grid_size
origin_x = (x+.5)*grid_size
origin_y = (y+.5)*grid_size
target_x = (tx+.5)*grid_size
target_y = (ty+.5)*grid_size
direction = point_direction(origin_x, origin_y, target_x, target_y);
total_distance = point_distance(origin_x, origin_y, target_x, target_y);
lerp_start = (5 - ttl - 1) * .2
lerp_end = (5 - ttl) * .2
show_debug_message(string(lerp_start) + " " + string(lerp_end))

