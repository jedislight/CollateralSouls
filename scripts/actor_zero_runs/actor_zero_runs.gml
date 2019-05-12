{
    Actor.runs = 0;
    Actor.best_score = 0;
    if(directory_exists("NN") == false)
    {
        directory_create("NN");
    }
    
    var files = ds_list_create();
    var f = file_find_first("NN/S*", 0);
    while(f != "")
    {
        ds_list_add(files, f);
        f = file_find_next();
    }
    file_find_close();
    
    for(var i = 0; i < ds_list_size(files); ++i)
    {
        var f = files[|i];
        var old = "NN/"+f;
        var replace = "R"+string(actor_file_name_read(old, "R"))
        var replace_with = "R"+string(0);
        var new = string_replace(old, replace, replace_with);
        var best = actor_file_name_read(old, "B");
        var r = "B"+string(best);
        var r_w = "B"+string(0);
        new = string_replace(new, r, r_w);
        file_rename(old, new);        
    }
    
    ds_list_destroy(files);
}
