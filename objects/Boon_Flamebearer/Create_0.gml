event_inherited();
description = "Carry the light of the world"
var player = instance_find(Player, 0);
if(instance_exists(player))
{
    if(not perk_exists(player, Perk_Holy_Fire))
    {
        perk_grant(player, Perk_Holy_Fire);
        var perk = perk_get(player, Perk_Holy_Fire);
        perk.temporary = true;
    }
    
    if(not perk_exists(player, Perk_Aura))
    {
        perk_grant(player, Perk_Aura);
        var perk = perk_get(player, Perk_Aura);
        perk.temporary = true;
    }
}

