{
    return 0;
    var state_width = ds_grid_width(Simulation.state_grid);
    var state_height = ds_grid_height(Simulation.state_grid);
    
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        if(Actor.input_is_local[#xx,yy])
        {
            Actor.input_x[#xx,yy] = clamp(Actor.input_x[#xx,yy], 0, Actor.network_width - 1);
            Actor.input_y[#xx,yy] = clamp(Actor.input_y[#xx,yy], 0, Actor.network_height - 1);
            Actor.input_x_prime[#xx,yy] = clamp(Actor.input_x_prime[#xx,yy], 0, Actor.network_width - 1);
            Actor.input_y_prime[#xx,yy] = clamp(Actor.input_y_prime[#xx,yy], 0, Actor.network_height - 1);
        }
        else
        {
            Actor.input_x[#xx,yy] = clamp(Actor.input_x[#xx,yy], 0, state_width - 1);
            Actor.input_y[#xx,yy] = clamp(Actor.input_y[#xx,yy], 0, state_height - 1);
            Actor.input_x_prime[#xx,yy] = clamp(Actor.input_x_prime[#xx,yy], 0, state_width - 1);
            Actor.input_y_prime[#xx,yy] = clamp(Actor.input_y_prime[#xx,yy], 0, state_height - 1);        
        }
    }
}
