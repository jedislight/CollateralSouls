event_inherited();
name = "Inferno Rounds [Ritual]"
ritual = ritual_inferno_rounds
active = false;
duration = 4;
value = 5;
detail = "Ritual performed every time you wait. Ranged attacks burn the target for 1 damage for "+string(value)+" rounds. Ritual lasts "+string(duration-1)+" rounds";
owner = noone
ds_list_add(any, Perk_Magically_Gifted, Perk_Pact_Ritual, Perk_Background_Switch);
keep_during_mirror = true;
creature_acquirable = false;

