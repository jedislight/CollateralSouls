/// @description is_passable(xx, yy)
/// @param xx
/// @param  yy
{
    var xx = argument0
    var yy = argument1
    with(Object)
    {
        if(x == xx and y == yy)
        {
            if(not passable)
            {
                return false
            }
        }
    }
    
    return true
}
