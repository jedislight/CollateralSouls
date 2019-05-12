event_inherited()
glyph = "m"
glyph_tile_x = 13;
glyph_tile_y = 6;
color = make_colour_rgb(133, 165, 111)
fighter.hp = 40.0
fighter.armor = 0.0
fighter.hp_max = 40.0
fighter.accuracy = 0.0
fighter.damage = 0.0
fighter.ranged_damage = 0.0
fighter.ranged_distance_min = 1;
fighter.ranged_distance_max = 1;
fighter.hit_description_ranged = " shot "
fighter.ranged_accuracy = 0.0
fighter.ranged_color_start = c_white;
fighter.ranged_color_end = c_white;
fighter.level = 4
name = "Mound of Bodies"
perk_grant(id, Perk_Armored);
perk_grant(id, Perk_Demon_Armor);
perk_grant(id, Perk_Void_Armor);

with(ai){instance_destroy()}
ai = component(AI_Spawner, id);
ai.spawned_creature = Zombie;
ai.spawn_rate = 2;
no_mirror = true;

