/// @description world_carve_L(obj_from, obj_into, x1, y1, x2, y2)
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
    var dx = abs(x1-x2);
    var dy = abs(y1-y2);
    
    var hub_x = x1;
    var hub_y = y2;
    if(dx < dy)
    {
        hub_x = x2;
        hub_y = y1;
    }
    world_carve_line(obj_from, obj_into, x1, y1, hub_x, hub_y)
    world_carve_line(obj_from, obj_into, x2, y2, hub_x, hub_y)
}
