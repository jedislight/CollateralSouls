/// @description world_carve_line(obj_from, obj_into, x1, y1, x2, y2)
/// @param obj_from
/// @param  obj_into
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
{
    var obj_from = argument0;
    var obj_into = argument1;
    var x1 = argument2;
    var y1 = argument3;
    var x2 = argument4;
    var y2 = argument5;

    //show_debug_message("Line_Paramaters: "  +string(x1) + " " + string(y1) + " " + string(x2) + " " + string(y2))
    var obj = collision_line(x1, y1, x2, y2, obj_from, false, false);
    while( obj > 0 )
    {
        instance_create(obj.x, obj.y, obj_into);
        with(obj){instance_destroy()}
        var obj = collision_line(x1, y1, x2, y2, obj_from, false, false);
    }
}
