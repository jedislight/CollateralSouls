event_inherited();
name = "Stone Body [Ritual]"
ritual = ritual_stone_body
active = false;
duration = 3;
value = .25;
detail = "Ritual performed every time you wait. Increases armor and melee damage by "+string(round(value*100))+"% for "+string(duration)+" rounds";
owner = noone
ds_list_add(any, Perk_Magically_Gifted, Perk_Pact_Ritual, Perk_Background_Switch);
keep_during_mirror = true;
creature_acquirable = false;

