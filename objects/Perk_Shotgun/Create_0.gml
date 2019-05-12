event_inherited();
name = "Shotgun [Firearm]"
ranged_distance_min = -1
ranged_distance_max = -1
damage = 2
detail = "Increases ranged damage by "+string(damage)+", decreases ranged maximum distance by "+string(ranged_distance_max)+", and removes ranged minimum distance. Attacks all targets near original target. Ignores cover penalties. #You may only ever have one [Firearm] perk at a time"
ds_list_add(exclusive, Perk_Rifle, Perk_Sniper_Rifle, Perk_Pact_Pistol);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch, Perk_Marksman);

