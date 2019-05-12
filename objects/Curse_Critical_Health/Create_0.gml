event_inherited();
description = "You feel a sharp pain in your chest"
var player = instance_find(Player, 0);
if(instance_exists(player))
{
    player.fighter.hp = player.fighter.hp * 0.5;
}

