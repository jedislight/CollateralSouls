event_inherited();
description = "Fear the brooding mother"
var f;
do
{
    f = instance_find(Object, irandom_range(0,instance_number(Object)-1));
}
until(is_passable(f.x,f.y));

var q = instance_create(f.x, f.y, Queen);
perk_grant(q, Perk_Demon_Armor);
perk_grant(q, Perk_Void_Armor);

q.ai.spawn_rate = 2;



