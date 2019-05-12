event_inherited();
name = "Void Armor [Adv. Demon Armor]"
value = 1
detail = "All damage dealt to you is reduced by " +string(value) + "#You may only ever have one [Adv. Demon Armor] perk at a time#Demonic Perk"
owner = noone
ds_list_add(exclusive, Perk_Shadow_Armor)
ds_list_add(required, Perk_Demon_Armor)
ds_list_add(exclusive, Perk_Background_Switch);

