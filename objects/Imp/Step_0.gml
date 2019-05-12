glyph_tile_x = 9;
glyph_tile_y = 4;
var player = instance_find(Player,0);
if(instance_exists(player))
{
    if(get_range_penalty(id, player) < 0.2)
    {
        glyph_tile_x = 10;
        glyph_tile_y = 4;
    }
}

