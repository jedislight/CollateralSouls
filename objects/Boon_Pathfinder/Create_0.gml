event_inherited();
description = "You make your own path"
var player = instance_find(Player, 0);
if(instance_exists(player))
{
    instance_create(player.x, player.y, Exit);
}

