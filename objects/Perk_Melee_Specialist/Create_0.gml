event_inherited();
name = "Melee Specialist"
value = 0.25
defense = 0.25;
hp = 10;
detail = "Increases melee accuracy and melee armor by "+string(round(100*value))+"% and HP by " + string(hp)
owner = noone
ds_list_add(required, Perk_Brawler);
ds_list_add(exclusive, Perk_Background_Switch);

