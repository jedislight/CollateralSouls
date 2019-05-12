for(var i = 0; i < number_of_inputs; ++i)
{
    input_votes[i] = floor(input_votes[i]*0.1);
}
ds_grid_clear(network, noone);

//run network
for(var yy = 0; yy < network_height; ++yy) for(var xx = 0; xx < network_width; ++xx)
{
    var is_local = input_is_local[#xx,yy];
    if(is_local == noone)
    {
        continue;
    }
    
    var grid = Simulation.state_grid;
    if(input_is_local[#xx,yy] == 1)
    {
        grid = network;
    }
    var rx = input_x[#xx,yy];
    var ry = input_y[#xx,yy];
    var signal = grid[#rx,ry];
    
    var rxp = input_x_prime[#xx,yy];
    var ryp = input_y_prime[#xx,yy];
    var signal_prime = grid[#rxp,ryp];
    
    var final = noone;
    
    var anding = input_is_anding[#xx,yy];
    
    if(anding)
    {
        if(signal == 0 or signal_prime == 0)
        {
            final = 0;
        }
        else if (signal == 1 and signal_prime == 1)
        {
            final = 1;
        }
    }
    else
    {
        if(signal == 1 or signal_prime == 1)
        {
            final = 1;
        }
        else if(signal == 0 and signal_prime == 0)
        {
            final = 0;
        }
    }
    
    if(input_is_inverse[#xx,yy] and final != noone)
    {
        if(final == 1) 
        {
            final = 0
        }
        else if (final == 0)
        {
            final = 1
        }
    }
    network[#xx,yy] = final;
}
//zero votes
for(var i = 0; i < number_of_inputs; ++i)
{
    input_votes[i] = 0;
}

//tally votes from considered range (upper half), each row is an input
for(var yy = 0; yy < network_height*0.5; ++yy)
{
    for(var xx = 0; xx < network_width; ++xx)
    {
        //yes checks are needed, noone doesn't add correctly to use sum
        if(network[#xx, yy] == 1)
        {
            input_votes[yy mod number_of_inputs] += 1;
        }
        if(network[#xx, yy] == 0)
        {
            input_votes[yy mod number_of_inputs] -= 1;
        }
    }

}

