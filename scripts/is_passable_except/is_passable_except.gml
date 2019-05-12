/// @description is_passable(xx, yy, except_type)
/// @param xx
/// @param  yy
/// @param  except_type
{
    var xx = argument0
    var yy = argument1
    with(Object)
    {
        if(x == xx and y == yy)
        {
            if(not passable and object_index != argument2)
            {
                return false
            }
        }
    }
    
    return true
}
