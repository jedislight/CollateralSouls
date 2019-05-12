event_inherited();
name = "Reaper [Adv. Sniper]"
ranged_damage = 0;

detail = "Shots hit all creatures between you and your target#You may only ever have one [Adv. Sniper] perk at a time#Angelic Perk"
ds_list_add(required, Perk_Sniper_Rifle);
ds_list_add(exclusive, Perk_Heartseeker);
ds_list_add(exclusive, Perk_Background_Sinner);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

