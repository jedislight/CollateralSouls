event_inherited();
name = "Berserker"
value = 0.5;
falloff = 0.1;
detail = "Deal " + string(round(value*100.0)) + "% more melee damage directly after taking damage. This bonus fades by " + string(round(falloff*100.0)) + "% each round after taking damage"
owner = noone

ds_list_add(exclusive, Perk_Background_Switch);

