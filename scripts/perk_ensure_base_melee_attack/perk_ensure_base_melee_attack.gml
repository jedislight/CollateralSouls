{
    var creature = argument0;
    var fighter = creature.fighter;
    var level = fighter.level;
    
    fighter.accuracy = max(fighter.accuracy, 0.25 + (level-1) * 0.1);
    fighter.damage = max(fighter.damage, 5 + (level-1));
}
