{
    var text = argument0;
    var key = argument1;
    
    var start = string_pos(key, text);
    if(start == 0)
    {
        return -1;
    }
    
    var value_string = "";
    do
    {
        ++start;
        value_string += string_char_at(text, start);
    } until (string_char_at(text,start) == "." or string_char_at(text,start) == "S" or string_char_at(text,start) == "B" or string_char_at(text,start) == "G" or string_char_at(text,start) == "R")
    return real(value_string);
}
