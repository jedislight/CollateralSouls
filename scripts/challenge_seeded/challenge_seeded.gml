condition_set(Condition_Seeded);
var seed_condition = condition_get(Condition_Seeded);
if(argument_count > 0)
{
    seed_condition.value = challenge_hash(argument[0]);
}
if(instance_exists(seed_condition))
{
    var seed = seed_condition.value;
    random_set_seed(seed);
}
challenge_random();
