event_inherited();
name = "Sniper Rifle [Firearm]"
ranged_distance_min = 2
ranged_distance_max = 12
ranged_accuracy = 1.0
ranged_damage = 6
detail = "Increases ranged damage by "+string(ranged_damage)+", ranged accuracy by 100% and ranged maximum distance by "+string(ranged_distance_max)+", but must be charged to fire and also increases the ranged minimum distance by "+string(ranged_distance_min)+". Penalty for shots under the minimum range increased signifigantly.#You may only ever have one [Firearm] perk at a time"
ds_list_add(exclusive, Perk_Rifle, Perk_Shotgun, Perk_Pact_Pistol);
owner = noone
ds_list_add(exclusive, Perk_Background_Switch);

