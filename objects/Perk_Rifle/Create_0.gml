event_inherited();
name = "Assult Rifle [Firearm]"
ranged_distance_max = 4
ranged_damage = 0
detail = "Fire 2 additional shots with cumulative 100% accuracy penalties. Ranged maximum distance increased by "+string(ranged_distance_max) + "#You may only ever have one [Firearm] perk at a time"
ds_list_add(exclusive, Perk_Sniper_Rifle, Perk_Shotgun, Perk_Pact_Pistol);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

