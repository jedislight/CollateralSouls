/// @description perk_is_available(object, perk)
/// @param object
/// @param  perk
{
    var object = argument0;
    var perk = argument1;
    var p = new_perk(perk, noone);
    var result = true;
    if(perk_exists(object, perk))
    {
        result = false;   
    }
    if(object_is_ancestor(object.object_index, Creature) and p.creature_acquirable == false)
    {
        result = false;
    }
    var any_met = false;
    for(var i = 0; i < ds_list_size(p.any); ++i)
    {
        if(perk_exists(object, p.any[|i]) or (object.object_index == Player and condition_exists(Condition_No_Perk_Checks)))
        {
            any_met = true;
            break;
        }
    }
    if(any_met = false and ds_list_size(p.any) > 0)
    {
        result = false;
    }
    for(var i = 0; i < ds_list_size(p.required); ++i)
    {
        if(not perk_exists(object, p.required[|i]) and (p.required[|i] == Perk_Unobtainable or (object.object_index != Player or not condition_exists(Condition_No_Perk_Checks))))
        {
            result = false;
            break;
        }
    }
    for(var i = 0; i < ds_list_size(p.exclusive); ++i)
    {
        if(perk_exists(object, p.exclusive[|i]))
        {
            result = false;
            break;
        }
    }
    
    with(p){instance_destroy()}
    return result;
}
