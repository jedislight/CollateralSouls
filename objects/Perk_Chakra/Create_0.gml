event_inherited();
name = "Chakra [Adv. Grace]"
detail = "Damage reduction from Grace now applies even if you make a melee attack#You may only ever have one [Adv. Grace] perk at a time#Angelic Perk"
owner = noone
ds_list_add(required, Perk_Grace);
ds_list_add(exclusive, Perk_Ethereal);
ds_list_add(exclusive, Perk_Background_Sinner);

ds_list_add(exclusive, Perk_Background_Switch);

