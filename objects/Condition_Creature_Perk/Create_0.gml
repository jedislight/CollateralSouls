event_inherited();
name = "Creatures Start With"
var done = false;
do
{
    value = Simulation.perks[|irandom_range(0,ds_list_size(Simulation.perks)-1)];
    var p = instance_create(0,0,value);
    description = p.name;
    done = p.creature_acquirable;
    with(p) {instance_destroy()}
}until(done)


