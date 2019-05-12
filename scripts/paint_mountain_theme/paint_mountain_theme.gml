{
    var puddle_chance = 0.25;
    var dirt_chance = 0.50;
    var snow_chance = 0.30;
    var daylight_chance = 0.50;
    var stream_chance = 0.80;//high because stream could go along edge and not show up
    
    if(random_range(0.0, 1.0) < stream_chance)
    {
        paint_stream();
    }
    
    if(random_range(0.0,1.0) < puddle_chance)
    {
        paint_snow();
    }
    
    if(random_range(0.0,1.0) < puddle_chance)
    {
        paint_puddles();
    }
    
    if(random_range(0.0,1.0) < dirt_chance)
    {
        paint_dirt();
        paint_dirt();
    }
    
    if(random_range(0.0,1.0) < daylight_chance)
    {
        instance_create(0,0,Daylight);
        with(Lamp){instance_destroy()};
    }
    
    with(Wall)
    {
        glyph = "^"
        glyph_tile_x = 14;
        glyph_tile_y = 5;
        color = c_ltgray;
    }
}
