{
    var file_name = argument0;
    with(Actor)
    {
        species = actor_file_name_read(file_name, "S");
        generation = actor_file_name_read(file_name, "G");
        best_score = actor_file_name_read(file_name, "B");
        runs = actor_file_name_read(file_name, "R");
    }
}
