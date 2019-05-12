with(Actor)
{
    if(directory_exists("NN") == false)
    {
        directory_create("NN");
    }
    
    var file_name = "NN/" + "S" + string(species) + "G" + string(generation) + "B" + string(best_score) + "R" + string(runs) + ".ini";
    if(file_exists(file_name))
    {
        file_delete(file_name);
    }
}
