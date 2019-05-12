event_inherited();
name = "Volatile Regeneration [Ritual]"
heal = 6;
cost = 1;
ritual = ritual_volatile_regeneration
detail = "Ritual performed every time you wait. Heals "+string(heal)+" HP but reduces maxium HP by " +string(cost);
owner = noone
ds_list_add(any, Perk_Magically_Gifted, Perk_Pact_Ritual, Perk_Background_Switch);
keep_during_mirror = true;
creature_acquirable = false;

