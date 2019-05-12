/// @description carve_mesh_rooms(room_max, room_width_min, room_width_max, room_height_min, room_height_max, start_x, start_y)
/// @param room_max
/// @param  room_width_min
/// @param  room_width_max
/// @param  room_height_min
/// @param  room_height_max
/// @param  start_x
/// @param  start_y
{
    var room_max = argument0;
    var room_width_min = argument1;
    var room_width_max = argument2;
    var room_height_min = argument3;
    var room_height_max = argument4;
    var start_x = argument5;
    var start_y = argument6;
    
    room_hubs_x = ds_list_create();
    room_hubs_y = ds_list_create();
    var first = true;
    repeat(room_max)
    {
        var top = random_range(2, Simulation.grid_height - room_height_min - 2)
        var bottom = min(Simulation.grid_height - 2, random_range(top+room_height_min, top+room_height_max))
        var left = random_range(2, Simulation.grid_width - room_width_min - 2)
        var right = min(Simulation.grid_width - 2, random_range(left+room_width_min, left+room_width_max))               
        if(first)
        {
            top = max(2, start_y - random_range(0, room_height_min));
            bottom = min(Simulation.grid_height - 2, random_range(top+room_height_min, top+room_height_max))
            left = max(2, start_x - random_range(0, room_width_min));
            right = min(Simulation.grid_width - 2, random_range(left+room_width_min, left+room_width_max))               
        }
        
        if(collision_rectangle(left, top, right, bottom, Floor, false, false) <= 0)
        {
            world_carve_rectangle(Uncarved, Floor, left, top, right, bottom, not first and random_range(0.0, 1.0) < 0.15);
            var hub_x = random_range(left, right);
            var hub_y = random_range(top, bottom);
            
            for(var i = 0; i < ds_list_size(room_hubs_x); ++i)
            {
                var target_x = room_hubs_x[| i];
                var target_y = room_hubs_y[| i];
                world_carve_line(Uncarved, Floor, hub_x,hub_y, target_x, target_y);
            }
            
            ds_list_add(room_hubs_x, hub_x);
            ds_list_add(room_hubs_y, hub_y);
        }
        
        first = false;
    }
    
    ds_list_destroy(room_hubs_x);
    ds_list_destroy(room_hubs_y);
}
