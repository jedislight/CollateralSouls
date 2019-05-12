/// @description perk_get(object, perk)
/// @param object
/// @param  perk
{
    var object = argument0;
    var perk = argument1;
    
    if(perk_exists(object,perk))
    {
        return object.perks[? perk];
    }
    
    return noone
}
