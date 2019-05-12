event_inherited();
name = "Grace [Melee Style]"
value = 0.75
damage = 3
detail = "Gain "+string(damage)+" melee damage and you take "+string(floor(value*100))+"% less damage on turns you do not attack#You may only ever have one [Melee Style] perk at a time"
owner = noone
ds_list_add(exclusive, Perk_Brawler);
ds_list_add(exclusive, Perk_Background_Switch);

