frame = 0;
draw_debug_grid_mouse_tooltip = false
draw_debug_grid_overlay = false
enum draw_mode
{
    glyph,
    tile
}
mode = draw_mode.tile;
Renderer.tile_background = noone
overdraw_grid=ds_grid_create(60,40);
tileset_swap(Config.strings[?"tileset"]);

