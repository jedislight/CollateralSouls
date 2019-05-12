{
    var perk = instance_create(0,0,argument0);
    var result = perk.name;
    with(perk){instance_destroy()}
    return result;
}
