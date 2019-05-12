/// @description get_cover(source_obj, target_obj)
/// @param source_obj
/// @param  target_obj
{
    var xx = argument0.x;
    var yy = argument0.y;
    var xx2 = argument1.x;
    var yy2 = argument1.y;
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
    
    var result = 0.0;
    var checks = 1.0/21.0;
    var m = 0.5;
    var fc = 0.99;
    var nc = 0.01;
    if(collision_line(xx+m,yy+m,xx2+m,yy2+m, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +nc,yy2 +nc, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +fc,yy2 +fc, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +nc,yy2 +fc, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +fc,yy2 +nc, Object, false, false) <= 0){result += checks}   

    if(collision_line(xx+nc,yy+nc,xx2+nc,yy2+nc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+nc,xx2+nc,yy2+nc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+nc,yy+fc,xx2+nc,yy2+nc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+fc,xx2+nc,yy2+nc, Object, false, false) <= 0){result += checks}

    if(collision_line(xx+nc,yy+nc,xx2+fc,yy2+nc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+nc,xx2+fc,yy2+nc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+nc,yy+fc,xx2+fc,yy2+nc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+fc,xx2+fc,yy2+nc, Object, false, false) <= 0){result += checks}
    
    if(collision_line(xx+nc,yy+nc,xx2+nc,yy2+fc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+nc,xx2+nc,yy2+fc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+nc,yy+fc,xx2+nc,yy2+fc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+fc,xx2+nc,yy2+fc, Object, false, false) <= 0){result += checks}
    
    if(collision_line(xx+nc,yy+nc,xx2+fc,yy2+fc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+nc,xx2+fc,yy2+fc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+nc,yy+fc,xx2+fc,yy2+fc, Object, false, false) <= 0){result += checks}
    if(collision_line(xx+fc,yy+fc,xx2+fc,yy2+fc, Object, false, false) <= 0){result += checks}
    /*
    if(collision_line(xx+m,yy+m,xx2+m,yy2+m, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +0,yy2 +0, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +1,yy2 +1, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +0,yy2 +1, Object, false, false) <= 0){result += checks}   
    if(collision_line(xx+m,yy+m,xx2 +1,yy2 +0, Object, false, false) <= 0){result += checks}   

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
    */
    result *= 100
    result = round(result)
    result /= 100
    
    result = clamp(result, 0.0, 1.0);
    
    instance_activate_all();
    
    return result
}
