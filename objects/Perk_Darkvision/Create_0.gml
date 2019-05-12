event_inherited();
name = "Darkvision [Vision]"
detail = "You can see without light#You may only ever have one [Vision] perk at a time#Demonic Perk"
owner = noone
creature_acquirable = false;
ds_list_add(required, Perk_Aura);
ds_list_add(exclusive, Perk_Background_Saint);
ds_list_add(exclusive, Perk_Clairvoyance, Perk_Lifesense);
ds_list_add(exclusive, Perk_Background_Switch);

