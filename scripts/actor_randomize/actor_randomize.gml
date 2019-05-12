{
    var actor = argument0;
    var node_density = 0.95;
    var node_locality = 0.50;
    
    actor.species = 1;
    actor.best_score = 0;
    actor.runs = 0;
    actor.generation = 1;
    
    ds_grid_clear(actor.input_is_local, noone);
    ds_grid_clear(actor.input_x, noone);
    ds_grid_clear(actor.input_y, noone);
    ds_grid_clear(actor.input_x_prime, noone);
    ds_grid_clear(actor.input_y_prime, noone);
    ds_grid_clear(actor.input_is_inverse, noone);
    ds_grid_clear(actor.input_is_anding, noone);
    
    for(var yy = 0; yy < actor.network_height; ++yy) for(var xx = 0; xx < actor.network_width; ++xx)
    {
        if(random_range(0.0,1.0) > node_density)
        {
            continue;
        }
        
        var t_is_local;
        if(random_range(0.0,1.0) < node_locality and xx >= 1)
        {
            t_is_local = true;
        }
        else
        {
            t_is_local = false;
        }
        var t_input_x = 0;
        var t_input_y = 0;
        var t_input_x_prime = 0;
        var t_input_y_prime = 0;
        var t_input_is_inverse = choose(true,false);
        var t_input_is_anding = choose(true,false);
        if(t_is_local)
        {
            t_input_x = irandom_range(0, xx-1);
            t_input_y = irandom_range(0, actor.network_height-1);

            t_input_x_prime = irandom_range(0, xx-1);
            t_input_y_prime = irandom_range(0, actor.network_height-1);
        }
        
        if(t_is_local == false)
        {
            t_input_x = irandom_range(0, ds_grid_width(Simulation.state_grid)-1);
            t_input_y = irandom_range(0, ds_grid_height(Simulation.state_grid)-1);
            t_input_x_prime = irandom_range(0, ds_grid_width(Simulation.state_grid)-1);
            t_input_y_prime = irandom_range(0, ds_grid_height(Simulation.state_grid)-1);
        }
        
        actor.input_is_local[#xx,yy] = t_is_local;
        actor.input_x[#xx,yy] = t_input_x;
        actor.input_y[#xx,yy] = t_input_y;
        actor.input_x_prime[#xx,yy] = t_input_x_prime;
        actor.input_y_prime[#xx,yy] = t_input_y_prime;
        actor.input_is_inverse[#xx,yy] = t_input_is_inverse;
        actor.input_is_anding[#xx,yy] = t_input_is_anding;
    }
}
