event_inherited();
name = "Initiative"
value = 0.50;
falloff = 0.05;
detail = "Reduces damage by " + string(round(falloff*100.0)) + "% per turn since you were last damaged up to " + string(round(value*100.0)) + "% reduction"
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

