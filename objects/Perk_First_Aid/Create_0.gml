event_inherited();
name = "First Aid"
value = 0.5;
detail = "Waiting heals " + string(round(value*100.0)) + "% of the last wound you have taken"
owner = noone
creature_acquirable = false;
ds_list_add(exclusive, Perk_Background_Switch);

