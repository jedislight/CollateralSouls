/*spawn_rate = 15
spawn_counter = irandom_range(0, spawn_rate)
spawned_creature = Larva*/

++spawn_counter
while(spawn_counter > spawn_rate)
{
    repeat(3)
    {
        spawn_x = owner.x + irandom_range(-1,1);
        spawn_y = owner.y + irandom_range(-1,1);
        if(is_passable(spawn_x, spawn_y))
        {
            var creature = instance_create(spawn_x, spawn_y, spawned_creature);
            creature.fighter.level = 0;
            break;
        }
    }
    spawn_counter -= spawn_rate;
}
