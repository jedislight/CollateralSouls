event_inherited();
name = "Radiant Armor [Armor]"
value = .15
luminosity = 16
detail = "Grants "+string(floor(100*value))+"% additional Armor and you emit light.#You may only ever have one [Armor] perk at a time#Angelic Perk"
owner = noone
ds_list_add(exclusive, Perk_Demon_Armor)
ds_list_add(required, Perk_Armored)
ds_list_add(exclusive, Perk_Background_Sinner);
ds_list_add(exclusive, Perk_Background_Switch);

