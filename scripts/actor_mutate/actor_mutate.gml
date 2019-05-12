{
    var mutation_rate = irandom_range(1,floor(Actor.network_width * Actor.network_height * 0.005));
    var node_density = 0.95;
    repeat(mutation_rate)
    {
        var xx = irandom_range(0, Actor.network_width - 1);
        var yy = irandom_range(0, Actor.network_height - 1);
        if(random_range(0.0,1.0) <= node_density)
        {
            var grid = Simulation.state_grid;
            var loc = irandom_range(1,100) < 75;
            if(xx == 0)
            {
                loc = false;//can't be local in first column
            }
            Actor.input_is_local[#xx,yy] = loc;
            if(loc)
            {
                grid = Actor.network;
            }
            
            if(loc)
            {
                Actor.input_x[#xx,yy] = irandom_range(0, xx-1);
                Actor.input_x_prime[#xx,yy] = irandom_range(0, xx-1);
            }
            else
            {
                Actor.input_x[#xx,yy] = irandom_range(0, ds_grid_width(grid)-1);
                Actor.input_x_prime[#xx,yy] = irandom_range(0, ds_grid_width(grid)-1);
            }
            Actor.input_y[#xx,yy] = irandom_range(0, ds_grid_height(grid)-1);
            Actor.input_y_prime[#xx,yy] = irandom_range(0, ds_grid_height(grid)-1);
            Actor.input_is_inverse[#xx,yy] = choose(true,false);
            Actor.input_is_anding[#xx,yy] = choose(true,false);
        }
        else
        {
            Actor.input_is_local[#xx,yy] = noone;
            Actor.input_is_inverse[#xx,yy] = noone;
            Actor.input_is_anding[#xx,yy] = noone;
            Actor.input_x[#xx,yy] = noone;
            Actor.input_y[#xx,yy] = noone;
            Actor.input_x_prime[#xx,yy] = noone;
            Actor.input_y_prime[#xx,yy] = noone;
        }
    }
}
