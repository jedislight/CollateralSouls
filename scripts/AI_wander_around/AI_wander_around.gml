/// @description AI_wander()
{  
    var new_x = owner.x + irandom_range(-1,1);
    var new_y = owner.y + irandom_range(-1,1);
    var can_move = is_passable(new_x, new_y);
    if(can_move)
    {
        owner.x = new_x
        owner.y = new_y
    }
    
    return can_move;
}
