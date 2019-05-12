event_inherited();
name = "Teleport [Ritual]"
ritual = ritual_teleport
active = false;
duration = 3;
detail = "Ritual performed every time you wait. Ranged attacks teleport you next to the target, lasts "+string(duration-1)+" rounds";
owner = noone
ds_list_add(any, Perk_Magically_Gifted, Perk_Pact_Ritual, Perk_Background_Switch);
keep_during_mirror = true;
creature_acquirable = false;

