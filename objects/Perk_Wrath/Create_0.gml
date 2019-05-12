event_inherited();
name = "Wrath [Adv. Brawling]"
value = 3;
hp = 20;
detail = "Increases melee damage by "+string(value)+" and HP by " + string(hp) + "#You may only ever have one [Adv. Brawling] perk at a time#Angelic Perk"
owner = noone
ds_list_add(required, Perk_Brawler);
ds_list_add(exclusive, Perk_Fury);
ds_list_add(exclusive, Perk_Background_Sinner);
ds_list_add(exclusive, Perk_Background_Switch);

