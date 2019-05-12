/// @description EVENT_PERK_GRANTED
owner.fighter.ranged_accuracy += accuracy
owner.fighter.accuracy += accuracy
owner.fighter.hp_max += hp;
owner.fighter.hp = clamp(owner.fighter.hp+hp, 0.0, owner.fighter.hp_max);
owner.fighter.damage += damage
owner.fighter.ranged_damage += damage
owner.fighter.armor += armor

