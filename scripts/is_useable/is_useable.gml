/// @description is_usable(xx, yy);
/// @param xx
/// @param  yy
{
    var xx = argument0
    var yy = argument1
    with(Usable_Object)
    {
        if(x == xx and y == yy and script_exists(on_use))
        {
            return id;
        }
    }
    
    return noone
}
