if(delay <= 0)
{
    ttl -= 1;
    if(ttl <= 0)
    {
        instance_destroy();
    }
    
    var grid_size = Renderer.grid_size
    origin_x = (x+.5)*grid_size
    origin_y = (y+.5)*grid_size
    target_x = (tx+.5)*grid_size
    target_y = (ty+.5)*grid_size
    lerp_start = (10 - ttl - 1) * .1
    lerp_end = (10 - ttl) * .1
}
delay -= 1;

