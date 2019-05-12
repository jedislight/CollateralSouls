/// @description instance_choose(object_index)
/// @param object_index
{
    var object = argument0;
    var number = instance_number(object);
    if(number == 0)
    {
        return noone;
    }
    
    return instance_find(object, irandom_range(0, number-1));
}
