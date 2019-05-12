/// @description EVENT_PERK_GRANTED
perk_ensure_base_ranged_attack(owner);
owner.fighter.ranged_distance_max += ranged_distance_max;
owner.fighter.ranged_damage += ranged_damage;
owner.fighter.burst = 3;

