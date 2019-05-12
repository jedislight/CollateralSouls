event_inherited();
name = "Player Starts With"
value = Simulation.perks[|irandom_range(0,ds_list_size(Simulation.perks)-1)];
var p = instance_create(0,0,value);
description = p.name;
with(p) {instance_destroy()}


