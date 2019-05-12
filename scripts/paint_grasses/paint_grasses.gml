{
    repeat(irandom_range(4,20))
    {
        var floor_instance = instance_find(Floor, irandom_range(0, instance_number(Floor)-1));
        world_carve_splotch(Floor, Grass, floor_instance.x, floor_instance.y, irandom_range(5,10));        
    }
}
