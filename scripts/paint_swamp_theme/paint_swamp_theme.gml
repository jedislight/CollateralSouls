{  
    with(Floor)
    {
        instance_change(Murk, true);
    }
    
    with(Lamp)
    {
        glyph = "~"
        color = color_add_noise(make_colour_rgb(163,174,126), 10)
        light_color = color
        if(id mod 10 < 2)
        {
            instance_destroy()
        }
    }
    
    repeat(irandom_range(5,20))
    {
        paint_pillar();
    }
    
    with(Wall)
    {
        glyph = choose("{", "}");
        color = make_colour_rgb(100,60,40);
    }
}
