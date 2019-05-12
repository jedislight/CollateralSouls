if(ai != noone)
{
    with(ai){instance_destroy()}
}
if(fighter != noone)
{
    with(fighter){instance_destroy()}
}

if(ds_exists(perks, ds_type_map))
{
    var size = ds_map_size(perks) - 1;
    var first = ds_map_find_first(perks);
    for (var i = 0; i <= size; i++;)
    {
        with(perks[?first]){instance_destroy()}
        first = ds_map_find_next(perks, first);
    }
    ds_map_destroy(perks);
    perks = noone;
}

