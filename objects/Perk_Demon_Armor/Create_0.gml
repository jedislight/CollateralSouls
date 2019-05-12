event_inherited();
name = "Demon Armor [Armor]"
value = .10
hp = 10
detail = "Grants "+string(floor(100*value))+"% additional Armor and " +string(hp) + " HP.#You may only ever have one [Armor] perk at a time#Demonic Perk"
owner = noone
ds_list_add(exclusive, Perk_Radiant_Armor)
ds_list_add(exclusive, Perk_Background_Saint);
ds_list_add(exclusive, Perk_Background_Switch);
ds_list_add(required, Perk_Armored)



