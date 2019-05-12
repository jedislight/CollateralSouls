event_inherited();
description = "You have been healed fully"
var player = instance_find(Player, 0);
if(instance_exists(player))
{
    player.fighter.hp = player.fighter.hp_max;
}

