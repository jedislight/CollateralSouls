var v = ds_list_create();
for(var i = 0; i < number_of_inputs; ++i)
{
    ds_list_add(v, input_votes[i]);
}
ds_list_sort(v, false);
var index = frame; 
var index = index mod number_of_inputs;
var max_vote = v[|index];
ds_list_destroy(v);

c = ds_list_create();
for(var i = 0; i < number_of_inputs; ++i)
{
    if(input_votes[i] == max_vote)
    {
        ds_list_add(c, i);
    }
}
ds_list_shuffle(c);
chosen_input_response = c[|0];
ds_list_destroy(c);

//last
++frame;

