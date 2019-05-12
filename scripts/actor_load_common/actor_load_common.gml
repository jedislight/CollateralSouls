{
    ini_open("NN/common.ini");
    Actor.species_count = max(ini_read_real("general", "species_count", 1), Actor.species_count);
    ini_close();
}
