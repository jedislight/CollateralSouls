event_inherited();
description = "Your foes will be brittle"
with(Creature)
{
    fighter.hp = fighter.hp_max * 0.05;
}

