/// @description is_visible_quick(obj_looker, obj_looked_at)
/// @param obj_looker
/// @param  obj_looked_at
{
    var obj_looker = argument0;
    var obj_looked_at = argument1;
    if(not instance_exists(obj_looker) or not instance_exists(obj_looked_at))
    {
        return 0.0;
    }
    var xx = obj_looker.x;
    var yy = obj_looker.y;
    var xx2 = obj_looked_at.x;
    var yy2 = obj_looked_at.y;
    //instance_deactivate_region(min(xx2, xx)-1, min(yy2,yy)-1, abs(xx-xx2)+2, abs(yy-yy2)+2, false, false);

    with(Object)
    {
        if(light_blocking == false)
        {
            instance_deactivate_object(id)
        }
    }

    instance_deactivate_object(argument0);
    instance_deactivate_object(argument1);
    
    
    if(collision_line(xx+.5,yy+.5,xx2+.5,yy2+.5, Object, false, false) <= 0){instance_activate_all();return 1.0}   
    if(collision_line(xx+.5,yy+.5,xx2 +0,yy2 +0, Object, false, false) <= 0){instance_activate_all();return 1.0}
    if(collision_line(xx+.5,yy+.5,xx2 +1,yy2 +1, Object, false, false) <= 0){instance_activate_all();return 1.0}
    if(collision_line(xx+.5,yy+.5,xx2 +0,yy2 +1, Object, false, false) <= 0){instance_activate_all();return 1.0}
    if(collision_line(xx+.5,yy+.5,xx2 +1,yy2 +0, Object, false, false) <= 0){instance_activate_all();return 1.0}

    instance_activate_all();
    return 0.0;
    /*

    if(collision_line(xx,yy,xx2,yy2, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy,xx2,yy2, Object, false, false) <= 0){result += checks}
    if(collision_line(xx,yy+1,xx2,yy2, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy+1,xx2,yy2, Object, false, false) <= 0){result += checks}

    if(collision_line(xx,yy,xx2+1,yy2, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy,xx2+1,yy2, Object, false, false) <= 0){result += checks}
    if(collision_line(xx,yy+1,xx2+1,yy2, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy+1,xx2+1,yy2, Object, false, false) <= 0){result += checks}
    
    if(collision_line(xx,yy,xx2,yy2+1, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy,xx2,yy2+1, Object, false, false) <= 0){result += checks}
    if(collision_line(xx,yy+1,xx2,yy2+1, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy+1,xx2,yy2+1, Object, false, false) <= 0){result += checks}
    
    if(collision_line(xx,yy,xx2+1,yy2+1, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy,xx2+1,yy2+1, Object, false, false) <= 0){result += checks}
    if(collision_line(xx,yy+1,xx2+1,yy2+1, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+1,yy+1,xx2+1,yy2+1, Object, false, false) <= 0){result += checks}

    result *= 100
    round(result)
    result /= 100
    
    if(re_1)
    {
        instance_activate_object(argument0);
    }
    
    if(re_2)
    {
        instance_activate_object(argument1);
    }
    
    return result
    */  
}
