{
    var param_to_find = argument0;
    show_debug_message("param to find: " + param_to_find );
    for(var i = 0; i < parameter_count(); ++i)
    {
        var param = parameter_string(i);
        show_debug_message("param: " + param);
        if(param == param_to_find)
        {
            show_debug_message("param found");
            return i;
        }
    }
    show_debug_message("param not found");
    return -1;
}
