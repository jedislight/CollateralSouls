/// @description out_of_range_by(min,max,value)
/// @param min
/// @param max
/// @param value
{
    var min_v = argument0;
    var max_v = argument1;
    var v = argument2;
    if( v < min_v)
    {
        return -abs(min_v - v);
    }
    if(v > max_v)
    {
        return abs(max_v - v);
    }
    
    return 0;
}
