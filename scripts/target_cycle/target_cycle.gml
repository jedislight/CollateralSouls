/// @description target_cycle(cycle_count)
/// @param cycle_count
{
    var cycle_count = argument0;
    var index = ds_list_find_index(Simulation.targeting.targets, Simulation.targeting.target);
    var target_count = ds_list_size(Simulation.targeting.targets);
    var init_target = index;
    if(target_count == 0)
    {
        Simulation.targeting.target = noone;
        return false;
    }
    if ( index < 0 )
    {
        index = -1;
    }
    
    index += cycle_count;
    
    while(index < 0)
    {
        index += target_count;
    }
    
    while(index >= target_count)
    {
        index -= target_count;
    }
    if(init_target != index)
    {
        with(Fighter_Component)
        {
            seeker_bonus = 0;
        }
    }
    Simulation.targeting.target = Simulation.targeting.targets[| index];
    return true;
}
