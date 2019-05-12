{
    repeat(irandom_range(2,10))
    {
        var floor_instance = instance_find(Floor, irandom_range(0, instance_number(Floor)-1));
        world_carve_splotch(Floor, Lava, floor_instance.x, floor_instance.y, irandom_range(2,6));        
        
        with(Lava)
        {
            var clear = true;
            for(var xx = -1; xx <= 1; ++xx)for(var yy = -1; yy <=1; ++yy)
            {
                clear = clear and is_passable_except(x+xx, y+yy, Lava);       
            }
            if(not clear)
            {
                instance_destroy();
                instance_create(x,y, Floor);
            }
            else
            {
                instance_deactivate_object(id);
                var n = instance_nearest(x,y, Lava);
                instance_activate_object(id);
                if(id mod 2 == 0 and instance_exists(n) and distance(id, n) <= 2)
                {
                    luminosity = 0;
                }
            }
        }
    }
}
