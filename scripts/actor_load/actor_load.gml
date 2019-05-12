with(Actor)
{
    if(directory_exists("NN") == false)
    {
        return 0;
    }
    
    var file_name = argument0;
    if(file_exists(file_name) == false)
    {
        return 0;
    }
    
    ini_open(file_name);
    ds_grid_read(input_is_local, ini_read_string("grids", "input_is_local", ""));
    ds_grid_read(input_x, ini_read_string("grids", "input_x", ""));
    ds_grid_read(input_y, ini_read_string("grids", "input_y", ""));
    ds_grid_read(input_x_prime, ini_read_string("grids", "input_x_prime", ""));
    ds_grid_read(input_y_prime, ini_read_string("grids", "input_y_prime", ""));
    ds_grid_read(input_is_inverse, ini_read_string("grids", "input_is_inverse", ""));
    ds_grid_read(input_is_anding, ini_read_string("grids", "input_is_anding", ""));
    ini_close();
    
    log_message("Loaded " + file_name);
    log_message("Network Locality " + string(round(actor_get_network_locality()*100))+"%");
    
    actor_load_file_name_contents(file_name);
    
    actor_load_common();
    
    actor_sanatize();
    
    frame = 0;
    
    var player = instance_find(Player,0);
    if(instance_exists(player))
    {
        player.name = actor_get_name();
    }
}
