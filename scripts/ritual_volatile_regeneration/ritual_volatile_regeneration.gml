{
    var owner = argument0;
    var ritual = perk_get(owner, Perk_Volatile_Regeneration_Ritual);
    if(instance_exists(ritual))
    {
        var fighter = owner.fighter;
        if(fighter.hp != fighter.hp_max and fighter.hp_max > ritual.cost)
        {
            fighter.hp_max -= ritual.cost;
            fighter.hp = min(fighter.hp + ritual.heal, fighter.hp_max);
        }
    }
}
