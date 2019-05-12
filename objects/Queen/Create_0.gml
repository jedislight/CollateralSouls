event_inherited()
glyph = "Q"
glyph_tile_x = 1;
glyph_tile_y = 5;
color = make_colour_rgb(180, 90, 255)
light_color = color
luminosity = 4;
fighter.hp = 15.0
fighter.hp_max = 15.0
fighter.damage = 0.0
fighter.accuracy = 0.0
fighter.armor = 0.3
fighter.ranged_damage = 0.0
fighter.ranged_accuracy = 0.0
fighter.ranged_distance_min = 1.0
fighter.ranged_distance_max = 1.0
fighter.level = 2
name = "Queen of Worms"
undead = false
perk_grant(id, Perk_Armored);
perk_grant(id, Perk_Aura);

with(ai){instance_destroy()}
ai = component(AI_Spawner, id);
ai.spawned_creature = Larva;
ai.spawn_rate = 20;
no_mirror = true;

