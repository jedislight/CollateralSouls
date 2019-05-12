{
    if(condition_exists(Condition_Seeded))
    {
        return noone;
    }
    var nemesis_key = argument0;
    var xx = argument1;
    var yy = argument2;
    var perk_list = Simulation.nemesis.creatures[? nemesis_key];
    var nemesis_type = object_find_by_name(perk_list[|0]);
    if(nemesis_type != noone)
    {
        var creature = instance_create(xx,yy, nemesis_type);
        creature.name = nemesis_key;
        creature.nemesis = true;
        for(var i = 1; i < ds_list_size(perk_list); ++i)
        {
            var hp_gain = 5;
            var damage_gain = 1;
            var accuracy_gain = 0.1;
            var armor_gain = 0.025;
            
            creature.fighter.hp += hp_gain;
            creature.fighter.hp_max += hp_gain;
            creature.fighter.damage += damage_gain;
            creature.fighter.ranged_damage += damage_gain;
            creature.fighter.accuracy += accuracy_gain;
            creature.fighter.ranged_accuracy += accuracy_gain;
            creature.fighter.armor += armor_gain;
            creature.fighter.level += 1;
            
            var perk_type = object_find_by_name(perk_list[|i]);
            perk_grant(creature, perk_type);
        }
        show_debug_message("spawning nemesis : " + creature.name);
        return creature;
    }
    
    return noone;
}
