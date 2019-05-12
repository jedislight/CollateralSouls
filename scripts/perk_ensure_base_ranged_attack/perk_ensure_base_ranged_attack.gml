{
    var creature = argument0;
    var fighter = creature.fighter;
    var level = fighter.level;
    
    fighter.ranged_accuracy = max(fighter.ranged_accuracy, 0.15 + (level-1) * 0.1);
    fighter.ranged_damage = max(fighter.ranged_damage, 4 + (level-1));
    if(fighter.ranged_distance_max <= 1)
    {
        fighter.ranged_distance_max = 8;
        fighter.ranged_distance_min = 2;
    }
}
