event_inherited();
description = "Your presence is known to all"
var player = instance_find(Player, 0)
if( instance_exists(player))
{
    with(AI_Component)
    {
        last_known_player_x = player.x
        last_known_player_y = player.y
        owner.has_seen_player = true;
    }
}

