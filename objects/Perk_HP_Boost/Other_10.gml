/// @description EVENT_PERK_GRANTED
owner.fighter.hp_max += value;
owner.fighter.hp = clamp(owner.fighter.hp+value, 0.0, owner.fighter.hp_max);

