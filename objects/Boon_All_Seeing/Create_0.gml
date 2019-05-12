event_inherited();
description = "You see everything but death"
var player = instance_find(Player, 0);
if(instance_exists(player))
{
    if(not perk_exists(player, Perk_Clairvoyance))
    {
        perk_grant(player, Perk_Clairvoyance);
        var perk = perk_get(player, Perk_Clairvoyance);
        perk.temporary = true;
    }
    
    if(not perk_exists(player, Perk_Darkvision))
    {
        perk_grant(player, Perk_Darkvision);
        var perk = perk_get(player, Perk_Darkvision);
        perk.temporary = true;
    }
    if(not perk_exists(player, Perk_Lifesense))
    {
        perk_grant(player, Perk_Lifesense);
        var perk = perk_get(player, Perk_Lifesense);
        perk.temporary = true;
    }
}

