event_inherited();
name = "Magically Gifted"
accuracy = .10
armor = .04
hp = 5
damage = 1
detail = "Unlocks Rituals. Known Rituals trigger when waiting. Boost stats as if you had gained another level. Raises ranged and melee accuracy by " + string(round(100*accuracy)) + "%, ranged and melee damage by " + string(damage) + ", armor by 2.5%, and HP by " + string(hp)
owner = noone
creature_acquirable = false;
ds_list_add(exclusive, Perk_Background_Switch);

