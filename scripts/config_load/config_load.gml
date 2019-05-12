{ 
    with(Config)
    {
        instance_destroy()
    }
    var config = instance_create(0,0,Config);
    //show_message(string(config.reals))
    if(file_exists("config.ini"))
    {
        ini_open("config.ini")
        
        var size = ds_map_size(Config.reals) - 1;
        var key = ds_map_find_first(Config.reals);
        for (var i = 0; i <= size; ++i)
        {
            Config.reals[?key] = ini_read_real("reals", key, Config.reals[?key]);
            key = ds_map_find_next(Config.reals, key);
        }
        
        var size = ds_map_size(Config.strings) - 1;
        var key = ds_map_find_first(Config.strings);
        for (var i = 0; i <= size; ++i)
        {
            Config.strings[?key] = ini_read_string("strings", key, Config.strings[?key]);
            key = ds_map_find_next(Config.strings, key);
        }
        
        ini_close();
    }
    config_apply();
    return config;    
}
