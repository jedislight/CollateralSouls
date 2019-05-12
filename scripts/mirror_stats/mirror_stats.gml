{
    var A = argument0;
    var B = argument1;
    
    var modifier = A.fighter.level / max(B.fighter.level, 1);
    
    //mirror stats
    A.glyph = B.glyph;
    A.glyph_tile_x = B.glyph_tile_x;
    A.glyph_tile_y = B.glyph_tile_y;
    A.color = B.color;
    A.light_color = B.light_color;
    A.fighter.hp_regen = B.fighter.hp_regen;
    A.fighter.damage = B.fighter.damage * modifier;
    A.fighter.ranged_damage = B.fighter.ranged_damage * modifier;
    A.fighter.hp_max = B.fighter.hp_max * (modifier+1);
    A.fighter.hp = A.fighter.hp_max;
    A.fighter.accuracy = B.fighter.accuracy * modifier;
    A.fighter.ranged_accuracy = B.fighter.ranged_accuracy * modifier ;
    A.fighter.armor = B.fighter.armor * modifier;
    A.luminosity = B.luminosity;
    A.damage_fx_color = B.damage_fx_color;
    A.fighter.hit_description = B.fighter.hit_description;
    A.fighter.hit_description_ranged = B.fighter.hit_description_ranged;
    A.fighter.miss_description = B.fighter.miss_description;
    A.fighter.ranged_distance_min = B.fighter.ranged_distance_min;
    A.fighter.ranged_distance_max = B.fighter.ranged_distance_max;
    A.fighter.ranged_color_start = B.fighter.ranged_color_start;
    A.fighter.ranged_color_end = B.fighter.ranged_color_end;
    A.fighter.ranged_fx_ttl = B.fighter.ranged_fx_ttl;
    
    //clear non mirror_keep perks and re-apply mirror_keep perks
    for(var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        var perk = perk_get(A, Simulation.perks[|i]);
        if(instance_exists(perk))
        {
            if(perk.keep_during_mirror == false)
            {
                ds_map_delete(A.perks, perk.object_index);
            }
            else
            {
                with(perk){event_user(EVENT_PERK_GRANTED);}
            }
        }
    }
    
    //mirror perks
    for(var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        var perk = perk_get(B, Simulation.perks[|i]);
        if(instance_exists(perk))
        {
            perk_grant(A, perk.object_index, true/*no_event*/);
        }
    }
}
