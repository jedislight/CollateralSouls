/// @description check_key_repeat(delay, repeat, value);
/// @param delay
/// @param  repeat
/// @param  value
{
    var delay = argument0;
    var rep = argument1;
    var value = argument2;
    
    value = max(value - delay, 0);
    return value != 0 and value mod rep == 0;
}
