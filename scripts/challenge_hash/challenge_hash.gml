{
    var name = argument0;
    var result = 8675309;
    for( var i = 1; i <= string_length(name); ++i)
    {
        var char = string_char_at(name, i);
        var value = ord(char);
        var mode = i mod 2;
        if(mode == 0)
        {
            result += value;
        }
        else if( result > 1000000)
        {
            result /= value;
        }
        else
        {
            result *= value;
        }
    }
    return result;
}
