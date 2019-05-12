{
    var owner = argument0;
    var ritual = perk_get(owner, Perk_Flesh_Guise_Ritual);
    if(instance_exists(ritual) and ritual.active == false and ritual.ready == true)
    {
        ritual.active = true;
        ritual.remaining = ritual.duration;
        ritual.ready = false;
    }
}
