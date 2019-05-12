{
    var creature = argument0;
    creature.nemesis = true;
    creature.fighter.level += 1;
    var perk = noone;
    var perk_instance = noone;
    ds_list_shuffle(Simulation.perks);
    for (var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        if(perk_is_available(creature, Simulation.perks[|i]))
        {
            perk = Simulation.perks[|i];
            perk_instance = perk_grant(creature, Simulation.perks[|i]);
            break;
        }
    }
    
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
    
    var temp_creature = instance_create(0,0, creature.object_index);
    var needs_new_name = (temp_creature.name == creature.name);
    with(temp_creature){instance_destroy()}
    if(needs_new_name)
    {
        var new_name = nemesis_generate_name();
        log_message(creature.name + " has ascended as " + new_name + " and now stalks the afterlife with its new ability: " + perk_instance.name);
        creature.name = new_name;
    }
    else
    {
        log_message(creature.name + " has ascended and now stalks the afterlife with its new ability: " + perk_instance.name);
    }
    var perk_list = noone;
    if(ds_map_exists(Simulation.nemesis.creatures, creature.name))
    {
        perk_list = Simulation.nemesis.creatures[? creature.name];
    }
    if(perk_list = noone)
    {
        perk_list = ds_list_create();
        perk_list[|0] = object_get_name(creature.object_index);
    }
    if(perk != noone)
    {
        ds_list_add(perk_list, object_get_name(perk)); 
    }
    
    Simulation.nemesis.creatures[? creature.name] = perk_list;
    
    nemesis_save();
    
    return creature.name;
}
