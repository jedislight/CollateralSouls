event_inherited();
name = "Focused"
accuracy = .10

detail = "Increases ranged and melee accuracy by " + string(round(100*accuracy)) + "%"
owner = noone

ds_list_add(required, Perk_Unobtainable);
ds_list_add(exclusive, Perk_Background_Switch);

