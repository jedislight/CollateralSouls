{
    var name = argument0;
    for(var i = 0; i < 1000; ++i)
    {
        if(object_exists(i) and object_get_name(i) == name)
        {
            return i;
        }
    }
    
    return noone;
}
