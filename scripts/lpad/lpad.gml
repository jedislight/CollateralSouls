/// @description pad(string, min_width)
/// @param string
/// @param  min_width
{
    var value = string(argument0);
    var min_width = argument1;
    
    while(string_length(value) < min_width)
    {
        value = " " + value;
    }
    
    return value;
}
