event_inherited();
name = "Marksman"
ranged_distance_max = 3
ranged_accuracy = .10

detail = "Increases maxium range by "+string(ranged_distance_max)+"m and ranged accuracy by " + string(round(100*ranged_accuracy)) + "%"
owner = noone
ds_list_add(exclusive, Perk_Background_Switch, Perk_Shotgun);

