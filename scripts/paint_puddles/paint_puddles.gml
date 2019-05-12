{
    repeat(irandom_range(2,10))
    {
        var floor_instance = instance_find(Floor, irandom_range(0, instance_number(Floor)-1));
        world_carve_splotch(Floor, Water, floor_instance.x, floor_instance.y, irandom_range(2,6));        
    }
}
