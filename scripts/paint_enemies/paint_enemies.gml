/// @description paint_enemies(world_level, count);
/// @param world_level
/// @param  count
{
    var world_level = argument0;
    var creature_count = argument1;
    var player = instance_find(Player,0);
    if(is_final_floor())
    {
        return 0;
    }
    
    var malice_level = player.malice;
    var lvl1 = get_creature_type_of_level(1);
    var lvl2 = get_creature_type_of_level(2);
    var lvl3 = get_creature_type_of_level(3);
    var lvl4 = get_creature_type_of_level(4);
    var lvl5 = get_creature_type_of_level(5);
    var lvl6 = get_creature_type_of_level(6);
    //show_debug_message("Painting Enemies World Level:" + string(world_level))
    
    var highest_level_spawned = 0;
    var lowest_level_spawned = 999;
    var split = creature_count div 2;
    var counter = 0;
    repeat(creature_count)
    {
        ++counter;
        if(counter == split)
        {
            lvl1 = get_creature_type_of_level(1);
            lvl2 = get_creature_type_of_level(2);
            lvl3 = get_creature_type_of_level(3);
            lvl4 = get_creature_type_of_level(4);
            lvl5 = get_creature_type_of_level(5);
            lvl6 = get_creature_type_of_level(6);
        }
        
        var count = instance_number(Floor);
        var floor_instance = instance_find(Floor,irandom_range(0,count-1));
        if( floor_instance > 0)
        {
            var enemy = noone;
            switch(world_level + malice_level)
            {
                case 0:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl1)); break;
                case 1:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl1, lvl1, lvl2)) ;break;
                case 2:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl1, lvl2)) ;break;
                case 3:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl1, lvl2, lvl2, lvl3)); break;
                case 4:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl2, lvl2, lvl3, lvl3)); break;
                case 5:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl2, lvl3, lvl3, lvl3, lvl4)); break;
                case 6:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl3, lvl3, lvl4)); break;
                case 7:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl3, lvl4, lvl3, lvl4, lvl5)); break;                
                case 8:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl4, lvl3, lvl4, lvl5)); break;               
                case 9:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl4, lvl4, lvl5)); break;                
               case 10:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl4, lvl5, lvl6)); break;                
               case 11:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl6, lvl5)); break;                
               case 12:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl6, lvl6, lvl5)); break;                
               default:enemy = instance_create(floor_instance.x, floor_instance.y, choose(lvl6, lvl6, lvl5)); break;                               
            }
            highest_level_spawned = max(enemy.fighter.level, highest_level_spawned);
            lowest_level_spawned = min(enemy.fighter.level, lowest_level_spawned);
                                  
            //show_debug_message("Painting Enemies Creature Spawned:" + object_get_name(enemy.object_index))
            var visibility_move_passes = 3;
            while(instance_exists(player) and is_visible_quick(player, enemy) and visibility_move_passes > 0)
            {
                visibility_move_passes -= 1;
                floor_instance = instance_find(Floor,irandom_range(0,count-1));
                enemy.x = floor_instance.x;
                enemy.y = floor_instance.y;
            }
            if(condition_exists(Condition_Strong_Creature_Ranged))
            {
                enemy.fighter.ranged_damage *= 2;
            }
            if(condition_exists(Condition_Strong_Creature_Melee))
            {
                enemy.fighter.damage *= 2;
            }
            var starts_with = condition_get(Condition_Creature_Perk);
            if(instance_exists(starts_with))
            {
                perk_grant(enemy, starts_with.value);
            }
        }
    }
    //for each key in level range add to list
    var available_nemesis = ds_list_create();
    var key = ds_map_find_first(Simulation.nemesis.creatures);
    for(var i = 0; i < ds_map_size(Simulation.nemesis.creatures); ++i)
    {
        var nemesis_level = ds_list_size(Simulation.nemesis.creatures[? key]) - 1;
        var perk_list = Simulation.nemesis.creatures[? key];
        var creature_type = object_find_by_name(perk_list[|0]);
        if(creature_type != noone)
        {
            var temp_creature = instance_create(0,0, creature_type);
            nemesis_level += temp_creature.fighter.level;
            with(temp_creature){instance_destroy()}
            
            if(out_of_range_by(lowest_level_spawned, highest_level_spawned, nemesis_level) == 0)
            {
                ds_list_add(available_nemesis, key);
            }
        }
        key = ds_map_find_next(Simulation.nemesis.creatures, key);   
    }
    if(ds_list_size(available_nemesis) > 0)
    {
        ds_list_shuffle(available_nemesis);
        var visibility_move_passes = 3;
        var count = instance_number(Floor);
        var floor_instance = instance_find(Floor,irandom_range(0,count-1));
        var xx = floor_instance.x;
        var yy = floor_instance.y;
        while(instance_exists(player) and is_visible_quick(player, enemy) and visibility_move_passes > 0)
        {
            visibility_move_passes -= 1;
            floor_instance = instance_find(Floor,irandom_range(0,count-1));
            xx = floor_instance.x;
            yy = floor_instance.y;
        }
        nemesis_spawn(available_nemesis[|0], xx, yy);
    }
}
