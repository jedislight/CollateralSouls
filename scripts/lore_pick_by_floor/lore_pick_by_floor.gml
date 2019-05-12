{
    var current_floor = argument0;
    var clamped_floor = clamp(current_floor, 1, ds_list_size(Simulation.lore)-2);
    var final_lore_index = clamped_floor + irandom_range(-1,1);
    return Simulation.lore[|final_lore_index];
}
