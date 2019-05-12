/// @description perk_exists(object, perk)
/// @param object
/// @param  perk
{
    var object = argument0;
    var perk = argument1;
    if(instance_exists(object) and ds_exists(object.perks, ds_type_map))
    {
        return ds_map_exists(object.perks, perk);
    }
    
    return false;
}
