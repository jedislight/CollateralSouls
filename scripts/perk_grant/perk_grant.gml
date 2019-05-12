/// @description perk_grant(object, perk)
/// @param object
/// @param  perk
{
    var object = argument[0];
    var perk = argument[1];
    var no_event = false;
    if(argument_count > 2)
    {
        var no_event = argument[2];
    }
    
    if( not ds_map_exists(object.perks, perk))
    {
        var p = new_perk(perk, object);
        object.perks[? perk] = p;
        if(no_event == false)
        {
            with(p){event_user(EVENT_PERK_GRANTED)}
        }
        if(object.object_index == Player)
        {
            log_message(object.name + " gained " + p.name)
        }
        if(perk_exists(object, Perk_Shotgun))
        {
            object.fighter.ranged_distance_min = 1;
        }
        return p;
    }
    
    return noone;
}
