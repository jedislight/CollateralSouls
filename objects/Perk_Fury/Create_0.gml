event_inherited();
name = "Fury [Adv. Brawling]"
value = 15
detail = "You attack every creature in melee range every round in addition to your normal action. Also increases melee damage by "+string(value)+"#You may only ever have one [Adv. Brawling] perk at a time#Demonic Perk"
owner = noone
ds_list_add(required, Perk_Brawler);
ds_list_add(exclusive, Perk_Wrath);
ds_list_add(exclusive, Perk_Background_Saint);
ds_list_add(exclusive, Perk_Background_Switch);

