event_inherited()
glyph = "P"
color = c_aqua
glyph_tile_x = 0;
glyph_tile_y = 5;
light_color = color
luminosity = 2.0
fighter.hp = 45.0
fighter.armor = 0.125
fighter.hp_max = 45.0
fighter.damage = 11.0
fighter.accuracy = 0.5
fighter.ranged_damage = 11.0
fighter.ranged_distance_min = 2;
fighter.ranged_distance_max = 8;
fighter.hit_description_ranged = " shot "
fighter.ranged_accuracy = 0.6
fighter.ranged_color_start = c_white;
fighter.ranged_color_end = c_aqua;
fighter.level = 5
name = "Purifier"
perk_grant(id, Perk_Shotgun);
perk_grant(id, Perk_Armored);
perk_grant(id, Perk_Radiant_Armor);
perk_grant(id, Perk_Solar_Armor);

