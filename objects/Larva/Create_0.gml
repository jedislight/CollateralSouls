event_inherited()
glyph = "l"
glyph_tile_x = 12;
glyph_tile_y = 6;
color = make_colour_rgb(140, 90, 255)
fighter.hp = 1.0
fighter.hp_max = 1.0
fighter.damage = 1.0
fighter.accuracy = 0.0
fighter.armor = 0.0
fighter.ranged_damage = 0.0
fighter.ranged_accuracy = 0.0
fighter.ranged_distance_min = 1.0
fighter.ranged_distance_max = 1.0
fighter.level = 0
fighter.hit_description = " stings "
fighter.no_history = true;
name = "Larval Worm"
undead = false

with(ai){instance_destroy()}
ai = component(AI_Wander, id);

