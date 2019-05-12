event_inherited();
name = "Blood Secret [Ritual]"
ritual = ritual_blood_secret
active = false;
detail = "Ritual performed every time you wait. All damage you take this turn is also gained as XP";
owner = noone
limit =  1000
ds_list_add(any, Perk_Magically_Gifted, Perk_Pact_Ritual, Perk_Background_Switch);
ds_list_add(exclusive, Perk_Tentacle_Whip);
keep_during_mirror = true;
creature_acquirable = false;

