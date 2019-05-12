{
    var best_of_rounds = 1;
    Actor.this_session += 1;
    var files = ds_list_create();
    var bests = ds_list_create();
    var runs = ds_list_create();
    var generations = ds_list_create();
    var species = ds_list_create();
    
    ds_grid_clear(Actor.network, noone);
    
    if(directory_exists("NN") == false)
    {
        directory_create("NN");
    }
    
    if(paramater_is_present("ai_mode"))//ai_mode override check
    {
        var ai_mode_index = paramater_get_index("ai_mode");
        var ai_path_override_index = ai_mode_index + 1;
        if( ai_path_override_index < parameter_count())
        {
            var to_load = parameter_string(ai_path_override_index);
            
            if(file_exists(to_load) and string_char_at(to_load,1) == "N")
            {
                actor_load(to_load);
                return 0;
            }
        }   
    }
    
    var f = file_find_first("NN/S*", 0);
    while(f != "")
    {
        ds_list_add(files, "NN/"+f);
        ds_list_add(bests, actor_file_name_read(f, "B"));
        ds_list_add(runs, actor_file_name_read(f, "R"));
        ds_list_add(generations, actor_file_name_read(f, "G"));

        var s = actor_file_name_read(f, "S");
        ds_list_add(species, s);
        Actor.species_count = max(Actor.species_count, s);
        f = file_find_next();
    }
    file_find_close();
    
    //load species_count
    actor_load_common();
    
    //ensure at least 30 actor files
    if(ds_list_size(files) == 0)
    {
        var manifest = file_text_open_append("NN/Manifest.txt");
        for(var i = ds_list_size(files); i < 10; ++i)
        {
            actor_randomize(Actor.id);
            Actor.species_count += 1;
            Actor.species = Actor.species_count;
            Actor.runs = 5
            actor_save();
            file_text_write_string(manifest, "SPAWNED S" + string(Actor.species) + "G" + string(Actor.generation));
            file_text_writeln(manifest);
        }
        
        ds_list_destroy(files);
        ds_list_destroy(bests);
        ds_list_destroy(runs);
        ds_list_destroy(species);
        ds_list_destroy(generations);
        file_text_close(manifest);
        return 0;
    }
    
    //if any actor less than 3 runs, run it
    var min_runs = 99;
    var min_runs_index = -1;
    for(var i = 0; i < ds_list_size(runs); ++i)
    {
        var r = runs[|i];
        if(r < min_runs)
        {
            min_runs = r;
            min_runs_index = i;
        }
    }
    if(min_runs_index != -1 and min_runs < best_of_rounds)
    {
        var to_load = files[|min_runs_index];
        actor_load(to_load);
        ds_list_destroy(files);
        ds_list_destroy(bests);
        ds_list_destroy(runs);
        ds_list_destroy(species);
        ds_list_destroy(generations);
        return 0;
    }
    
    var manifest = file_text_open_append("NN/Manifest.txt");
    //record final results
    for(var i = 0; i < ds_list_size(files); ++i)
    {
        file_text_write_string(manifest, "S"+string(species[|i])+"G"+string(generations[|i]) + " RECORDING "  + string(bests[|i]));
        file_text_writeln(manifest);
    }
    
    //if all actor files sufficently ran, kill worst half
    var half = ds_list_size(files) - 4;
    var deleted = 0;
    repeat(half)
    {
        var worst_index = 0;
        for(var i = 0; i < ds_list_size(files); ++i)
        {
            var best = bests[|i];
            if(best <= bests[|worst_index])//important <= , prefer to cull younger (less stable) individuals in tie situations
            {
                worst_index = i;
            }
        }
        
        file_delete(files[|worst_index]);
        file_text_write_string(manifest, "CULLING S" + string(species[|worst_index]) + "G" + string(generations[|worst_index]));
        file_text_writeln(manifest);
        ++deleted;
        
        ds_list_delete(files, worst_index);
        ds_list_delete(bests, worst_index);
        ds_list_delete(runs, worst_index);
        ds_list_delete(species, worst_index);
        ds_list_delete(generations, worst_index);
    }
    
    var worst_survivor = 9999;
    for(var i = 0; i < ds_list_size(files); ++i)
    {
        var best = bests[|i];
        if(best < worst_survivor)
        {
            worst_survivor = best;
        }
    }
    
    file_text_write_string(manifest, "GENERATION CUTOFF " + string(worst_survivor) );
    file_text_writeln(manifest);
    
    //repopulate
    randomize()
    while(file_count("NN/S*") < 9)
    {
        var index_a = irandom_range(0, ds_list_size(files)-1);
        var index_b = irandom_range(0, ds_list_size(files)-1);
 
        if(index_a == index_b or choose(true,false))
        {
            //mutate
            var index = irandom_range(0, ds_list_size(files)-1);
            actor_load(files[|index]);
            
            Actor.generation += 1;
            Actor.runs = 0;
            Actor.best_score = 0;
            
            actor_mutate();
            
            while(any_file_matching("NN/S"+string(Actor.species)+"G"+string(Actor.generation)+"*"))
            {
                Actor.generation += 1;
            }
            
            file_text_write_string(manifest, "S" + string(species[|index]) + "G" + string(generations[|index]) + " -MUTATE-> " + "S" + string(species[|index]) + "G" + string(Actor.generation));

        }
        else
        {
            //combine
            actor_combine(files[|index_a], files[|index_b]);       
                       
            Actor.runs = 0;
            Actor.best_score = 0;
            Actor.generation = max(generations[|index_a], generations[|index_b]) + 1;
            if(species[|index_a] != species[|index_b])
            {
                Actor.species_count += 1;
                Actor.species = Actor.species_count;
            }
            while(any_file_matching("NN/S"+string(Actor.species)+"G"+string(Actor.generation)+"*"))
            {
                Actor.generation += 1;
            }
            
            file_text_write_string(manifest, "S" + string(species[|index_a]) + "G" + string(generations[|index_a]) + " -COMBINED WITH-> " + "S" + string(species[|index_b]) + "G" + string(generations[|index_b]) + " -TO MAKE-> S" + string(Actor.species) + "G" + string(Actor.generation));
        }
        
        file_text_writeln(manifest);
        actor_save();
    }
    
    actor_randomize(Actor.id);
    Actor.species_count += 1;
    Actor.species = Actor.species_count;
    actor_save();
    file_text_write_string(manifest, "SPAWNED S" + string(Actor.species) + "G" + string(Actor.generation));
    file_text_writeln(manifest);
    file_text_close(manifest);   
    
    actor_zero_runs();
    
    //clean up lists
    ds_list_destroy(files);
    ds_list_destroy(bests);
    ds_list_destroy(runs);
    ds_list_destroy(species);
    ds_list_destroy(generations);
    game_end();
}
