event_inherited();
name = "Heartseeker [Adv. Sniper]"
minimum = 0.5

detail = "Waiting increases your damage against your target on your next attack, bonus lost when switching targets#You may only ever have one [Adv. Sniper] perk at a time#Demonic Perk"
ds_list_add(required, Perk_Sniper_Rifle);
ds_list_add(exclusive, Perk_Reaper);
ds_list_add(exclusive, Perk_Background_Saint);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

