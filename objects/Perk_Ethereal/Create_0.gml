event_inherited();
name = "Ethereal [Adv. Grace]"
value = 0.50
detail = "If you do not attack in a turn, there is a "+string(floor(100* value))+"% attacks will miss you and your melee attacks ignore armor#You may only ever have one [Adv. Grace] perk at a time#Demonic Perk"
owner = noone
ds_list_add(required, Perk_Grace);
ds_list_add(exclusive, Perk_Chakra);
ds_list_add(exclusive, Perk_Background_Saint);
ds_list_add(exclusive, Perk_Background_Switch);

