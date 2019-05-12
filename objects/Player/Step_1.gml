event_inherited()
if(perk_exists(id, Perk_Shadow_Armor))
{
    luminosity = 0;
}
if(condition_exists(Condition_Weak_Player_Melee))
{
    fighter.damage = 1;
}
if(condition_exists(Condition_Weak_Player_Ranged))
{
    fighter.ranged_damage = 1;
}

