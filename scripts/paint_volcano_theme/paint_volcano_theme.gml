{  
    repeat(irandom_range(1,3))
    {
        paint_lava();
    }
    
    with(Floor)
    {
        glyph = "."
        color = choose(make_colour_rgb(50,73,80),make_colour_rgb(58,57,57),make_colour_rgb(160,70,56),make_colour_rgb(196,81,58),make_colour_rgb(90,70,62))
    }
    
    with(Wall)
    {
        color = make_colour_rgb(90,70,62);
    }
}
