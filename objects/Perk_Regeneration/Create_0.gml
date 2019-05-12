event_inherited();
name = "Regeneration"
value = 0.5
detail = "Heals "+string(round(100*value))+"% HP every floor instead of 33%"
owner = noone
ds_list_add(exclusive, Perk_Background_Seeker);
ds_list_add(exclusive, Perk_Background_Sadist);
creature_acquirable = false;
ds_list_add(exclusive, Perk_Background_Switch);

