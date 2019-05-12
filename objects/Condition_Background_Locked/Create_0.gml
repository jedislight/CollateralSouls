event_inherited();
name = "Background"
value = choose(Perk_Background_Forgotton, Perk_Background_Sadist, Perk_Background_Saint, Perk_Background_Scholar, Perk_Background_Seeker, Perk_Background_Simple, Perk_Background_Sinner, Perk_Background_Survivor );
var p = instance_create(0,0, value);
description = p.name;
with(p){instance_destroy();}


