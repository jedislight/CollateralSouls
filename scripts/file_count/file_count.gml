{
    var f = file_find_first(argument0, 0);
    var count = 0;
    while(f != "")
    {
        ++count;
        f = file_find_next();
    }
    file_find_close();
    
    return count;
}
