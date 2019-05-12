{
    var player = instance_find(Player, 0);
    return instance_exists(player) and player.floors_covered == Simulation.final_floor-1;
}
