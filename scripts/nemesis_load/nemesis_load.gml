/// @description nemesis_load()
{
    var filename = "nemesis.dat"
    
    if(ds_exists(Simulation.nemesis.creatures, ds_type_map))
    {
        ds_map_destroy(Simulation.nemesis.creatures);
    }
    
    Simulation.nemesis.creatures = ds_map_create();
    
    if(file_exists(filename))
    {
        f = file_text_open_read(filename);
        var chunk = file_text_read_string(f);
        file_text_close(f);
        if(chunk != "")
        {
            ds_map_read(Simulation.nemesis.creatures, chunk);
        }
        
        var key = ds_map_find_first(Simulation.nemesis.creatures);
        for(var i = 0; i < ds_map_size(Simulation.nemesis.creatures); ++i)
        {
            var new_list = ds_list_create();
            var list_string = ds_list_read(new_list, Simulation.nemesis.creatures[? key]);
            Simulation.nemesis.creatures[? key] = new_list;
            key = ds_map_find_next(Simulation.nemesis.creatures, key);   
        }
        
        show_debug_message(string(ds_map_size(Simulation.nemesis.creatures)) + " nemesis loaded");
    }
    else
    {
        show_debug_message("no nemesis file to load");
    }
}
