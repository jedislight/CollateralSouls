event_inherited();
name = "Switch"
detail = "You never picked a side but were always on one.##Bonus: Become slain creatures ##Flaw: Learn and retain only a small set of mental perks and rituals"
owner = noone
creature_acquirable = false;
keep_during_mirror = true;

ds_list_add(exclusive, Perk_Background_Forgotton);
ds_list_add(exclusive, Perk_Background_Sinner);
ds_list_add(exclusive, Perk_Background_Saint);
ds_list_add(exclusive, Perk_Background_Seeker);
ds_list_add(exclusive, Perk_Background_Sadist);
ds_list_add(exclusive, Perk_Background_Scholar);
ds_list_add(exclusive, Perk_Background_Simple);
ds_list_add(exclusive, Perk_Background_Survivor);
ds_list_add(exclusive, Perk_Background_Slayer);

