event_inherited();
name = "Phoenix Armor [Adv. Radiant Armor]"
detail = "Damage that would kill you is removed from your maximum health instead. #You may only ever have one [Adv. Radiant Armor] perk at a time#Angelic Perk"
owner = noone
ds_list_add(required, Perk_Radiant_Armor);
ds_list_add(exclusive, Perk_Solar_Armor);
ds_list_add(exclusive, Perk_Background_Switch);

