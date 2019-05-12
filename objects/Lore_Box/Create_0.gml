event_inherited()
on_use = open_lore_menu
var player = instance_find(Player, 0);
if(is_final_floor())
{
    on_use = open_win_menu;   
}
luminosity = 0.0;
glyph = "?"
glyph_tile_x = 15;
glyph_tile_y = 3;
light_color = c_white
color = c_lime
_layer = -1
fow_memerable = true
always_bright = true
frame = 0
description = "Pick up"
overdraw = true


