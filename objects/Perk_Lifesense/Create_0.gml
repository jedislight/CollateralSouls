event_inherited();
name = "Lifesense [Vision]"
detail = "Always aware of all living creatures#You may only ever have one [Vision] perk at a time"
owner = noone
creature_acquirable = false;
ds_list_add(required, Perk_Aura, Perk_Unobtainable);
ds_list_add(exclusive, Perk_Clairvoyance, Perk_Darkvision);

