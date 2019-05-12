/// @description condition_active(condition_object_index)
/// @param condition_object_index
{
    var result = noone;
    if(condition_exists(argument0))
    {
        result = instance_find(argument0,0);
    }
    return result;
}
