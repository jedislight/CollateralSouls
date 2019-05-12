glyph_tile_x = 1;
glyph_tile_y = 6;
var player = instance_find(Player,0);
if(instance_exists(player))
{
    if(get_range_penalty(id, player) < 0.2)
    {
        glyph_tile_x = 0;
        glyph_tile_y = 6;
    }
}

