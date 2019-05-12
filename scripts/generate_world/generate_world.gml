/// @description generate_world(room_max, room_width_min, room_width_max, room_height_min, room_height_max)
/// @param room_max
/// @param  room_width_min
/// @param  room_width_max
/// @param  room_height_min
/// @param  room_height_max
{
    show_debug_message("generate_world::enter")
    var room_max = argument0;
    var room_width_min = argument1;
    var room_width_max = argument2;
    var room_height_min = argument3;
    var room_height_max = argument4;
    
    var scale_condition = condition_get(Condition_Scale);
    if(instance_exists(scale_condition))
    {
        var scalar = scale_condition.value;
        room_width_min = round(room_width_min * scalar);
        room_width_max = round(room_width_max * scalar);
        room_height_min = round(room_height_min * scalar);
        room_height_max = round(room_height_max * scalar);
    }
    
    var start_x = Simulation.grid_width * .5
    var start_y = Simulation.grid_height * .5
    var world_level = 0;
    var player = instance_find(Player, 0);
    if(instance_exists(player))
    {
        start_x = player.x;
        start_y = player.y;
        world_level = player.floors_covered;
    }
    
    //initial block to carve from
    for(var xx = 0; xx < Simulation.grid_width; ++xx) for(var yy = 0; yy < Simulation.grid_height; ++yy)
    {
        instance_create(xx,yy,Uncarved);    
    }
    //show_debug_message("carving blocks created")
    
    //carve rooms
    var room_type = irandom_range(0, 5);
    var uniformity = condition_get(Condition_Uniformity);
    if(instance_exists(uniformity))
    {
        room_type = uniformity.value mod 5;
    }
    //show_debug_message("room_type:" + string(room_type));
    switch(room_type)
    {
        case 0 : carve_halled_rooms(room_max, room_width_min, room_width_max, room_height_min, room_height_max, start_x, start_y); break;
        case 1 : carve_old_school_rooms(room_max, room_width_min, room_width_max, room_height_min, room_height_max, start_x, start_y); break;
        case 2 : carve_mesh_rooms(room_max, room_width_min, room_width_max, room_height_min, room_height_max, start_x, start_y); break;
        default: carve_mesh_rooms(room_max, room_width_min, room_width_max, room_height_min, room_height_max, start_x, start_y); break;
    }

    //show_debug_message("rooms carved, floor tile count: " + string(instance_number(Floor)))
    //carve walls
    with(Uncarved)
    {
        if(collision_rectangle(x-1,y-1,x+1,y+1, Floor, false, false) > 0)
        {
            instance_create(x,y, Wall);
        }
    }
    //show_debug_message("walls carved")
    
    //remove uncarved blocks
    with(Uncarved)
    {
        instance_destroy();
    }
    //show_debug_message("carving surface destroyed")
    
    //paint lights
    for(var i = 0; i <room_max; ++i)
    {
        var count = instance_number(Floor);
        var floor_instance = instance_find(Floor,irandom_range(0,count-1));
        if( instance_exists(floor_instance))
        {
            instance_create(floor_instance.x, floor_instance.y, Lamp);
        }
    }
    //show_debug_message("lights painted")
    
    //create player if not created yet
    if(instance_number(Player) == 0)
    {
        show_debug_message("generate_world::create_player::pre");
        create_player()
        show_debug_message("generate_world::create_player::post");
    }
    
    //paint enemies
    show_debug_message("generate_world::paint_enemies::pre")
    paint_enemies(world_level, room_max);
    //show_debug_message("enemies painted")
    show_debug_message("generate_world::paint_enemies::post")
    //paint decorations
    var decoration_passes = 1;
    if(random_range(0.0,1.0) < 0.15)
    {
        decoration_passes = 2;
    }
    repeat(decoration_passes)
    {
        paint_decorations();
    }
    //paint lore boxes
    paint_lore_box();
    
    //paint exits
    if(not is_final_floor())
    {
        var count = instance_number(Floor);
        var floor_instance = instance_find(Floor,irandom_range(0,count-1));
        instance_create(floor_instance.x, floor_instance.y, Exit);
        //show_debug_message("exit painted")
        
        var player = instance_find(Player, 0);
        if(player && player.floors_covered % 3 == 0)
        {        
            floor_instance = instance_find(Floor,irandom_range(0,count-1)); 
            var unstable_exit = instance_create(floor_instance.x, floor_instance.y, Exit);
            unstable_exit.color = c_red;
            unstable_exit.light_color = c_red;
            unstable_exit.on_use = open_unstable_exit_menu;
        }
    }
    
    //show_debug_message("tile count:"+ string(instance_number(Floor) + instance_number(Wall)));
    show_debug_message("generate_world::exit")
}
