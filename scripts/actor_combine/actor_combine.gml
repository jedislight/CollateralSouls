{
    var a = argument0;
    var b = argument1;
    
    if(a == b)
    {
        return 0;
    }
    
    actor_load(b);
    b_input_is_local = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_is_local, Actor.input_is_local);
    
    b_input_x = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_x, Actor.input_x);
    
    b_input_y = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_y, Actor.input_y);
    
    b_input_x_prime = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_x_prime, Actor.input_x_prime);
    
    b_input_y_prime = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_y_prime, Actor.input_y_prime);
    
    b_input_is_inverse = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_is_inverse, Actor.input_is_inverse);
    
    b_input_is_anding = ds_grid_create(Actor.network_width, Actor.network_height);
    ds_grid_copy(b_input_is_anding, Actor.input_is_anding);
    
    actor_load(a);
    
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        if(b_input_is_inverse[#xx,yy] == noone)
        {
            continue;//keep A if B is empty
        }
        else if (Actor.input_is_inverse[#xx,yy] == noone)
        {
            //keep B if A is empty
            Actor.input_is_inverse[#xx,yy] = b_input_is_inverse[#xx,yy];
            Actor.input_is_anding[#xx,yy] = b_input_is_anding[#xx,yy];
            Actor.input_x[#xx,yy] = b_input_x[#xx,yy];
            Actor.input_y[#xx,yy] = b_input_y[#xx,yy];
            Actor.input_x_prime[#xx,yy] = b_input_x_prime[#xx,yy];
            Actor.input_y_prime[#xx,yy] = b_input_y_prime[#xx,yy];
        }
        else
        {
            //combine if both populated
            Actor.input_is_inverse[#xx,yy] = choose(Actor.input_is_inverse[#xx,yy], b_input_is_inverse[#xx,yy]);
            Actor.input_is_anding[#xx,yy] = choose(Actor.input_is_anding[#xx,yy], b_input_is_anding[#xx,yy]);
            //if locality matches combine positions
            if(Actor.input_is_local[#xx,yy] == b_input_is_local[#xx,yy])
            {
                Actor.input_x[#xx,yy] = choose(Actor.input_x[#xx,yy], b_input_x[#xx,yy]);
                Actor.input_y[#xx,yy] = choose(Actor.input_y[#xx,yy], b_input_y[#xx,yy]);
                Actor.input_x_prime[#xx,yy] = choose(Actor.input_x_prime[#xx,yy], b_input_x_prime[#xx,yy]);
                Actor.input_y_prime[#xx,yy] = choose(Actor.input_y_prime[#xx,yy], b_input_y_prime[#xx,yy]);
            }
            else //if locality doesn't match, keep one or the other
            {
                if(choose(true,false))
                {
                    Actor.input_x[#xx,yy] = b_input_x[#xx,yy]
                    Actor.input_y[#xx,yy] = b_input_y[#xx,yy]                
                    Actor.input_x_prime[#xx,yy] = b_input_x_prime[#xx,yy]
                    Actor.input_y_prime[#xx,yy] = b_input_y_prime[#xx,yy]
                    Actor.input_is_local[#xx,yy] = b_input_is_local[#xx,yy]
                }
            }
        }
    }
    
    //clean up temp b grids
    ds_grid_destroy(b_input_is_local);
    ds_grid_destroy(b_input_x);
    ds_grid_destroy(b_input_y);
    ds_grid_destroy(b_input_x_prime);
    ds_grid_destroy(b_input_y_prime);
    ds_grid_destroy(b_input_is_inverse);    
    ds_grid_destroy(b_input_is_anding);
}
