event_inherited()
glyph = "R"
glyph_tile_x = 2;
glyph_tile_y = 5;
color = make_colour_rgb(165,42,42)
light_color = color
luminosity = 0;
fighter.hp = 50.0
fighter.armor = 0.12
fighter.hp_max = 50.0
fighter.accuracy = 0.60
fighter.damage = 11.0
fighter.ranged_damage = 20.0
fighter.ranged_distance_min = 2;
fighter.ranged_distance_max = 8;
fighter.hit_description_ranged = " shot "
fighter.ranged_accuracy = 0.60
fighter.ranged_color_start = c_white;
fighter.ranged_color_end = c_white;
fighter.level = 6
name = "Reaper"
perk_grant(id, Perk_Sniper_Rifle);
perk_grant(id, Perk_Marksman);
perk_grant(id, Perk_Reaper);
perk_grant(id, Perk_Focused);
perk_grant(id, Perk_Magically_Gifted);

