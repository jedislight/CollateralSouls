{   
    var f = file_find_first(argument0, 0);
    while(f != "")
    {
        file_find_close();
        return true;
    }
    file_find_close();
    return false;
}
