{
    var owner = argument0;
    var ritual = perk_get(owner, Perk_Blood_Secret_Ritual);
    if(instance_exists(ritual))
    {
        ritual.active = true;
    }
}
