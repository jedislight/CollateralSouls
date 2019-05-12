/// @description ds_grid_copy_looping(source, target, target_x, target_y, source_origin_x, source_origin_y);
/// @param source
/// @param  target
/// @param  target_x
/// @param  target_y
/// @param  source_origin_x
/// @param  source_origin_y
{
    var source = argument0;
    var target = argument1;
    var target_x = argument2;
    var target_y = argument3;
    var source_origin_x = argument4;
    var source_origin_y = argument5;
    
    var source_width = ds_grid_width(source);
    var source_height = ds_grid_height(source);
    
    for(var xx = 0; xx < source_width; ++xx) for(var yy = 0; yy < source_height; ++yy)
    {
        var from_x = xx;
        var from_y = yy;
        
        var to_x = xx - source_origin_x;
        var to_y = yy - source_origin_y;
        
        if(to_x < 0)
        {
            to_x += source_width;
        }
        
        if(to_y < 0)
        {
            to_y += source_height;
        }
        
        to_x += target_x;
        to_y += target_y;
        
        var new_value = source[#from_x, from_y];
        target[#to_x, to_y] = new_value;
    }
}
