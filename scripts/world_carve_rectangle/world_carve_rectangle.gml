/// @description world_carve_rectangle(obj_from, obj_into, x1, y1, x2, y2,[outline=false])
/// @param obj_from
/// @param  obj_into
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param [outline=false]
{
    var obj_from = argument[0];
    var obj_into = argument[1];
    //show_debug_message("Carving rectangle of " + object_get_name(obj_from) + " into " + object_get_name(obj_into));
    //show_debug_message("From instance count: " + string(instance_number(obj_from)))
    //show_debug_message("Into instance count: " + string(instance_number(obj_into)))
    var x1 = argument[2];
    var y1 = argument[3];
    var x2 = argument[4];
    var y2 = argument[5];
    var outline = false;
    if(argument_count > 6)
    {
        outline = argument[6];
    }
    //show_debug_message("Rectangle_Paramaters: "  +string(x1) + " " + string(y1) + " " + string(x2) + " " + string(y2))
    
    
    if(outline == false)
    {
        var instance_from = collision_rectangle(x1, y1, x2, y2, obj_from ,false, false);
        //show_debug_message("carving block, instance_from:" + string(instance_from));
        while( instance_exists(instance_from) )
        {
            instance_create(instance_from.x, instance_from.y, obj_into);
            with(instance_from){instance_destroy()}
            var instance_from = collision_rectangle(x1, y1, x2, y2, obj_from, false, false);
        }
    }
    else
    {
        world_carve_line(obj_from, obj_into, x1, y1, x1, y2);
        world_carve_line(obj_from, obj_into, x2, y1, x2, y2);
        world_carve_line(obj_from, obj_into, x1, y1, x2, y1);
        world_carve_line(obj_from, obj_into, x1, y2, x2, y2);
    }
}
