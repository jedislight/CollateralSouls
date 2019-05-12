with(Actor)
{
    if(directory_exists("NN") == false)
    {
        directory_create("NN");
    }
    
    ini_open("NN/common.ini");
    ini_write_real("general", "species_count", species_count);
    ini_close();
    
    var file_name = "NN/" + actor_get_name() + ".ini";
    ini_open(file_name);
    ini_write_string("grids", "input_is_local", ds_grid_write(input_is_local));
    ini_write_string("grids", "input_x", ds_grid_write(input_x));
    ini_write_string("grids", "input_y", ds_grid_write(input_y));
    ini_write_string("grids", "input_x_prime", ds_grid_write(input_x_prime));
    ini_write_string("grids", "input_y_prime", ds_grid_write(input_y_prime));
    ini_write_string("grids", "input_is_inverse", ds_grid_write(input_is_inverse));
    ini_write_string("grids", "input_is_anding", ds_grid_write(input_is_anding));
    ini_close();
}
