/// @description nemesis_save()
{
    var filename = "nemesis.dat"
    
    var save_map = ds_map_create();
    ds_map_copy(save_map, Simulation.nemesis.creatures);
    var key = ds_map_find_first(save_map);
    for(var i = 0; i < ds_map_size(save_map); ++i)
    {
        save_map[? key] = ds_list_write(save_map[? key]);
        key = ds_map_find_next(save_map, key);   
    }
   
    if(ds_map_size(save_map) > 0)
    {
        show_debug_message(string(ds_map_size(save_map)) + " nemesis, saving file");
        var chunk = ds_map_write(save_map);
        var f = file_text_open_write(filename);
        file_text_write_string(f, chunk);
        file_text_close(f);
    }
    else
    {
        show_debug_message("No nemesis, removing save file");
        if(file_exists(filename))
        {
            file_delete(filename);
        }
    }
}
