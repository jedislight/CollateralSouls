{
    var player = instance_find(Player, 0);
    if(instance_exists(player))
    {    
        with(Teleporter)
        {
            if((player.x != x or player.y != y) and is_passable(x,y))
            {
                instance_create(player.x, player.y, FX_Teleport_Source);
                player.x = x;
                player.y = y;
                instance_create(player.x, player.y, FX_Teleport_Target);
                break;
            }
        }
    }
}
