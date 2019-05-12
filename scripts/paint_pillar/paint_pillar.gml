{
    var f = instance_find(Floor, irandom(instance_number(Floor)-1));
    if(instance_exists(f))
    {
        var clear = true;
        for(var xx = -1; xx <= 1; ++xx)for(var yy = -1; yy <=1; ++yy)
        {
            clear = clear and is_passable(f.x+xx, f.y+yy);       
        }
        if(clear)
        {
            instance_create(f.x,f.y, Wall);
            with(f){instance_destroy();}
        }
    }
}
