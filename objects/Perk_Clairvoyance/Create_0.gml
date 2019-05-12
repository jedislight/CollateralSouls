event_inherited();
name = "Clairvoyance [Vision]"
detail = "Always aware of layout of the current floor#You may only ever have one [Vision] perk at a time#Angelic Perk"
owner = noone
creature_acquirable = false;
ds_list_add(any, Perk_Aura, Perk_Background_Switch);
ds_list_add(exclusive, Perk_Background_Sinner);
ds_list_add(exclusive, Perk_Darkvision, Perk_Lifesense);
keep_during_mirror = true;

