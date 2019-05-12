event_inherited();
name = "Paradox Trigger [Adv. Rifle]"
detail = "Missed and glancing ranged attacks are remade against the next nearest target. #You may only ever have one [Adv. Rifle] perk at a time#Demonic Perk"
ds_list_add(required, Perk_Rifle);
ds_list_add(exclusive, Perk_Holy_Fire);
ds_list_add(exclusive, Perk_Background_Saint);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

