/// @description world_carve_point(obj_from, obj_into, x1, y1)
/// @param obj_from
/// @param  obj_into
/// @param  x1
/// @param  y1
{
    var obj_from = argument0;
    var obj_into = argument1;
    var x1 = argument2;
    var y1 = argument3;
    
    var obj = collision_point(x1, y1, obj_from, false, false);
    while( obj > 0 )
    {
        instance_create(obj.x, obj.y, obj_into);
        with(obj){instance_destroy()}
        var obj = collision_point(x1, y1, obj_from, false, false);
    }
}
