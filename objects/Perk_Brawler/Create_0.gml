event_inherited();
name = "Brawling [Melee Style]"
value = 3
hp = 10;
accuracy = .25;
detail = "Increases melee damage by "+string(value)+", melee accuracy by "+string(floor(100.0*accuracy))+"%, and HP by " + string(hp) + "#You may only ever have one [Melee Style] perk at a time"
owner = noone
ds_list_add(exclusive, Perk_Grace);
ds_list_add(exclusive, Perk_Background_Switch);

