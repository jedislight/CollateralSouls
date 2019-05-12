/// @description find_instance_in_rectangle(object_index, x1,y1,x2,y2)
/// @param object_index
/// @param  x1
/// @param y1
/// @param x2
/// @param y2
{
    var type = argument0;
    var x1 = argument1;
    var y1 = argument2;
    var x2 = argument3;
    var y2 = argument4;
    
    with(type)
    {
        if(x >= x1 and x <= x2 and y >= y1 and y <= y2)
        {
            return id;
        }
    }
    
    return noone;
}
