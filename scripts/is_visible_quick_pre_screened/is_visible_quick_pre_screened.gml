/// @description is_visible_quick_pre_screened(xx,yy,xx2,yy2)
/// @param xx
/// @param yy
/// @param xx2
/// @param yy2
{
    var xx = argument0.x;
    var yy = argument0.y;
    var xx2 = argument1.x;
    var yy2 = argument1.y;
    //instance_deactivate_region(min(xx2, xx)-1, min(yy2,yy)-1, abs(xx-xx2)+2, abs(yy-yy2)+2, false, false);

    var re_1 = false;
    if(instance_exists(argument0))
    {
        re_1 = true;
        instance_deactivate_object(argument0);
    }
    
    var re_2 = false;
    if(instance_exists(argument1))
    {
        re_2 = true;
        instance_deactivate_object(argument1);
    }
    
    var xx_half = xx+.5;
    var yy_half = yy+.5;
    var xx2_far = xx2+1;
    var yy2_far = yy2+1;
    if(collision_line(xx_half,yy_half,xx2+.5 ,yy2+.5 , Object, false, false) <= 0){if(re_1){instance_activate_object(argument0);}if(re_2){instance_activate_object(argument1);}return true}   
    if(collision_line(xx_half,yy_half,xx2    ,yy2    , Object, false, false) <= 0){if(re_1){instance_activate_object(argument0);}if(re_2){instance_activate_object(argument1);}return true}
    if(collision_line(xx_half,yy_half,xx2_far,yy2_far, Object, false, false) <= 0){if(re_1){instance_activate_object(argument0);}if(re_2){instance_activate_object(argument1);}return true}
    if(collision_line(xx_half,yy_half,xx2    ,yy2_far, Object, false, false) <= 0){if(re_1){instance_activate_object(argument0);}if(re_2){instance_activate_object(argument1);}return true}
    if(collision_line(xx_half,yy_half,xx2_far,yy2    , Object, false, false) <= 0){if(re_1){instance_activate_object(argument0);}if(re_2){instance_activate_object(argument1);}return true}

    if(re_1){instance_activate_object(argument0);}if(re_2){instance_activate_object(argument1);}
    return false;
}
