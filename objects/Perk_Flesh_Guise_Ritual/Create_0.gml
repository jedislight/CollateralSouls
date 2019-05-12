event_inherited();
name = "Flesh Guise [Ritual]"
ritual = ritual_flesh_guise
active = false;
duration = 5;
ready = false;
detail = "Ritual performed every time you wait. Living creatures ignore you for "+string(duration)+" rounds. Effect canceled if you attack or deal damage. Must slay a creature between each use.";
owner = noone
creature_acquirable = false;
ds_list_add(any, Perk_Magically_Gifted, Perk_Pact_Ritual, Perk_Background_Switch);
keep_during_mirror = true;

