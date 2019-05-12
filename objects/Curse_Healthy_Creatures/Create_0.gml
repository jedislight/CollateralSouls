event_inherited();
description = "Your enemies gain great fortitude"
with(Creature)
{
    fighter.hp = fighter.hp * 1.5;
    fighter.hp_max = fighter.hp_max * 1.5;
}

