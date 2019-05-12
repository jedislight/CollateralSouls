{
    var owner = argument0;
    var ritual = perk_get(owner, Perk_Inferno_Rounds_Ritual);
    if(instance_exists(ritual) and ritual.active == false)
    {
        ritual.active = true;
        ritual.remaining = ritual.duration;
    }
}
