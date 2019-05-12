{
    if(instance_number(Teleporter) == 0)
    {
        repeat(2)
        {
            var floor_instance = instance_find(Floor, irandom_range(0, instance_number(Floor)-1));
            instance_create(floor_instance.x, floor_instance.y, Teleporter);
            show_debug_message("Teleporter Painted @" + string(floor_instance.x) + string(floor_instance.y));
            with(floor_instance){instance_destroy()}
        }
    }
}
