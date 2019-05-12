{
    var low = 0;
    var high = 1;
    var player = instance_find(Player,0);
    if(is_final_floor())
    {
        low = 30;
        high = 90;
    }
    repeat(irandom_range(low,high))
    {
        var floor_instance = instance_find(Floor, irandom_range(0, instance_number(Floor)-1));
        instance_create(floor_instance.x, floor_instance.y, Lore_Box);
    }
}
