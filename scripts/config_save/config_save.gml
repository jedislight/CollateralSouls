{
    if(paramater_is_present("ai_mode") or instance_number(Actor) > 0)
    {
        return 0;
    }
    ini_open("config.ini")
    //show_message(string(Config.reals))
    var size = ds_map_size(Config.reals) - 1;
    var key = ds_map_find_first(Config.reals);
    for (var i = 0; i <= size; ++i)
    {
        ini_write_real("reals", key, Config.reals[?key]);
        key = ds_map_find_next(Config.reals, key);
    }
    
    var size = ds_map_size(Config.strings) - 1;
    var key = ds_map_find_first(Config.strings);
    for (var i = 0; i <= size; ++i)
    {
        ini_write_string("strings", key, Config.strings[?key]);
        key = ds_map_find_next(Config.strings, key);
    }
    
    ini_close()    
}
