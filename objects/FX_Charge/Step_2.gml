var grid_size = Renderer.grid_size
origin_x = (x+.5)*grid_size
origin_y = (y+.5)*grid_size
radius = ttl;
ttl -= 1;
if(radius <= 0)
{
    instance_destroy();
}

