{
    var count_local = 0;
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        var loc = Actor.input_is_local[#xx,yy];
        if(loc)
        {
            ++count_local;
        }
    }
    
    return count_local / (1.0 * Actor.network_width * Actor.network_height)
}
