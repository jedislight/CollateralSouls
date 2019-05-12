event_inherited();
name = "Holy Fire [Adv. Rifle]"
value = 3
detail = "Ranged attacks burn the target, and all creatures between you and your target for 3 turns. #You may only ever have one [Adv. Rifle] perk at a time#Angelic Perk"
ds_list_add(required, Perk_Rifle);
ds_list_add(exclusive, Perk_Paradox_Trigger);
ds_list_add(exclusive, Perk_Background_Sinner);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

