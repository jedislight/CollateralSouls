/// @description EVENT_PERK_GRANTED
owner.fighter.accuracy += value;
owner.fighter.hp_max += hp;
owner.fighter.hp = clamp(owner.fighter.hp+hp, 0.0, owner.fighter.hp_max);

