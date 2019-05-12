//string_center(string, length);
{
    var str = argument0;
    var goal_size = argument1;
    
    var padding = goal_size - string_length(str);
    if(padding > 0)
    {
        var left_pad = padding div 2;
        var right_pad = padding div 2;
        if(padding != left_pad + right_pad)
        {
            left_pad += 1;
        }
        
        return string_repeat(" ", left_pad)+ str +string_repeat(" ", right_pad)
    }
    return str;
}
