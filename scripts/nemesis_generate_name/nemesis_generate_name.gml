{
    var prefix = ds_list_create();
    var core = ds_list_create();
    var suffix = ds_list_create();
    
    index = 0;
    prefix[|index++] = "";
    prefix[|index++] = "";
    prefix[|index++] = "";
    prefix[|index++] = "";
    prefix[|index++] = "a";
    prefix[|index++] = "be";
    prefix[|index++] = "de";
    prefix[|index++] = "el";
    prefix[|index++] = "fa";
    prefix[|index++] = "ga";
    prefix[|index++] = "jo";
    prefix[|index++] = "ki";
    prefix[|index++] = "la";
    prefix[|index++] = "ma";
    prefix[|index++] = "na";
    prefix[|index++] = "o";
    prefix[|index++] = "pa";
    prefix[|index++] = "re";
    prefix[|index++] = "si";
    prefix[|index++] = "ta";
    prefix[|index++] = "va";
    
    index = 0;
    core[|index++] = "bar";
    core[|index++] = "bri";
    core[|index++] = "ched";
    core[|index++] = "dell";
    core[|index++] = "far";
    core[|index++] = "gran";
    core[|index++] = "hal";
    core[|index++] = "jen";
    core[|index++] = "kel";
    core[|index++] = "lim";
    core[|index++] = "mor";
    core[|index++] = "net";
    core[|index++] = "penn";
    core[|index++] = "quil";
    core[|index++] = "rond";
    core[|index++] = "sark";
    core[|index++] = "shen";
    core[|index++] = "tur";
    core[|index++] = "vash";
    core[|index++] = "yor";
    core[|index++] = "zen";

    index = 0;
    suffix[|index++] = "";    
    suffix[|index++] = "a";    
    suffix[|index++] = "ac";    
    suffix[|index++] = "ai";    
    suffix[|index++] = "al";    
    suffix[|index++] = "am";    
    suffix[|index++] = "an";    
    suffix[|index++] = "ar";    
    suffix[|index++] = "ea";    
    suffix[|index++] = "el";    
    suffix[|index++] = "er";    
    suffix[|index++] = "ess";    
    suffix[|index++] = "ett";    
    suffix[|index++] = "ic";    
    suffix[|index++] = "id";    
    suffix[|index++] = "il";    
    suffix[|index++] = "in";    
    suffix[|index++] = "is";    
    suffix[|index++] = "or";    
    suffix[|index++] = "us";    
    
    var name;
    do
    {
        ds_list_shuffle(prefix);
        ds_list_shuffle(core);
        ds_list_shuffle(suffix);
        
        name = prefix[|0] + core[|0] + suffix[|0];
        name = string_insert(string_upper(string_char_at(name,1)), name, 1);
        name = string_delete(name, 2, 1);
        
        
    }until(ds_map_exists(Simulation.nemesis.creatures, name) == false);
    
    ds_list_destroy(prefix);
    ds_list_destroy(core);
    ds_list_destroy(suffix);
    
    return name;
}
