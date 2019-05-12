event_inherited();
name = "Solar Armor [Adv. Radiant Armor]"
value = 1
light = 16;
detail = "Increases your light radius and deals "+string(value)+" damage to enemies in your direct light each turn#You may only ever have one [Adv. Radiant Armor] perk at a time#Angelic Perk"
owner = noone
ds_list_add(required, Perk_Radiant_Armor);
ds_list_add(exclusive, Perk_Phoenix_Armor);
ds_list_add(exclusive, Perk_Background_Switch);

