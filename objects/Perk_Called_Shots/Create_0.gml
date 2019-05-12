event_inherited();
name = "Called Shots"
value = .10
detail = "Ranged attacks against targets with no cover ignore armor and deal "+string(floor(100*value))+"% more damage"
owner = noone

ds_list_add(exclusive, Perk_Background_Switch);

