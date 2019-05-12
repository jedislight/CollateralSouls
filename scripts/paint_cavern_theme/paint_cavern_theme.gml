{  
    with(Floor)
    {
        instance_change(Sand, true);
    }
    
    repeat(irandom_range(1,2))
    {
        paint_murk();
    }
    with(Lamp)
    {
        glyph = "."
        color = color_add_noise(make_colour_rgb(222,30,222), 10)
        glyph_tile_x = 13
        glyph_tile_y = 14
        light_color = color
        if(id mod 10 < 8)
        {
            instance_destroy()
        }
    }
    
    repeat(irandom_range(5,20))
    {
        paint_pillar();
    }
    
    if(random_range(0.0,1.0) < 0.50)
    {
        paint_teleporter();
    }
    
    with(Wall)
    {
        glyph = choose("^", "^");
        glyph_tile_x = 14;
        glyph_tile_y = 5;
        color = color_add_noise(make_colour_rgb(71,71,64), 10);
    }
}
