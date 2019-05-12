/// @description world_carve_splotch(obj_from, obj_into, center_x, center_y, diamater)
/// @param obj_from
/// @param  obj_into
/// @param  center_x
/// @param  center_y
/// @param  diamater
{
    var obj_from = argument0;
    var obj_into = argument1;
    var center_x = argument2;
    var center_y = argument3;
    var diamater = argument4;
    
    var radius = diamater * 0.5;
    var casts = ceil(diamater);
    
    repeat(casts)
    {
        var dir = random_range(0.0,360.0);
        var offset_x = lengthdir_x(radius, dir);
        var offset_y = lengthdir_y(radius, dir);
        world_carve_line(obj_from, obj_into, center_x, center_y, center_x + offset_x, center_y + offset_y);
    }      
}
