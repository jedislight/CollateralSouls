log_message("Player AI Enabled");
Analytics.enabled = false;
number_of_inputs = 13
for(var i = 0; i < number_of_inputs; ++i)
{
    input_votes[i] = 0;
}
this_session = 0;
network_width = 768;
network_height = number_of_inputs * 4;
network = ds_grid_create(network_width, network_height);
input_is_local = ds_grid_create(network_width, network_height);
input_x = ds_grid_create(network_width, network_height);
input_y = ds_grid_create(network_width, network_height);
input_x_prime = ds_grid_create(network_width, network_height);
input_y_prime = ds_grid_create(network_width, network_height);
input_is_inverse = ds_grid_create(network_width, network_height);
input_is_anding = ds_grid_create(network_width, network_height);

best_score = 0;
species = 0;
generation = 1;
runs = 0;

species_count = 1;
frame = 0;
player_turns_taken = 0;
chosen_input_response = 0;
actor_next();

