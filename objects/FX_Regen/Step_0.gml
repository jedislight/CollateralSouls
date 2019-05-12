if(instance_exists(target))
{
    target_x = target.x*16+8;
    target_y = target.y*16+8;
}

if(speed == 0 and instance_exists(target))
{
    motion_add(point_direction(target_x, target_y, x, y), 2);
    motion_add(irandom_range(0,360), 0.5);
}

speed *= 0.9
motion_add(point_direction(target_x, target_y, x, y), -2);
if(point_distance(target_x, target_y, x, y) < 8)
{
    instance_destroy();
}
alpha = clamp(alpha *0.99, 0,1.0);

