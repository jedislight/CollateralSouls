{
    var owner = argument0;
    var ritual = perk_get(owner, Perk_Stone_Body_Ritual);
    if(instance_exists(ritual) and ritual.active == false)
    {
        ritual.active = true;
        ritual.remaining = ritual.duration;
        
        owner.fighter.armor += ritual.value
        ritual.boost = owner.fighter.damage * ritual.value;
        owner.fighter.damage += ritual.boost;
    }
}
