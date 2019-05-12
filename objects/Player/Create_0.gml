event_inherited()
glyph = "@"
glyph_tile_x = 0;
glyph_tile_y = 4;
passable=false
color = c_yellow
fighter = component(Fighter_Component, id);
fighter.hp_regen = 0.0;
fighter.damage = 5.0
fighter.ranged_damage = 4.0
fighter.hp_max = 25.0
fighter.hp = 25.0
fighter.accuracy = 0.3
fighter.ranged_accuracy = 0.2
fighter.armor = 0.2
name = "Player"
luminosity = 4.0
floors_covered = 0.0
damage_fx_color = c_red
history = ds_list_create()
color_history = ds_list_create()
lore_boxes_found = 0;
attacked_this_turn = false;
hit_this_turn = false;
attacks_this_floor =0 
hits_this_floor=0
overdraw = true
_layer = 30;
malice = 0
show_debug_message("player create event:" + string(id));

