{
    var daylight_chance = 0.25;
    var stream_chance = 0.20;
         
    if(random_range(0.0,1.0) < daylight_chance)
    {
        instance_create(0,0,Daylight);
        with(Lamp){instance_destroy()};
    }
    
    if(random_range(0.0, 1.0) < stream_chance)
    {
        paint_stream();
    }
    
    repeat(irandom_range(1,3))
    {
        paint_grasses();
    }
    
    repeat(irandom_range(1,2))
    {
        paint_puddles();
    }
    
    repeat(irandom_range(60,120))
    {
        paint_pillar();
    }
    
    with(Floor)
    {
        instance_change(Dirt, true);
    }
    
    with(Wall)
    {
        glyph = choose("{", "}");
        glyph_tile_x = choose(13,11);
        glyph_tile_y = 7;
        color = make_colour_rgb(100,60,40);
    }
}
