y-=2

instance_deactivate_object(id);
var near = instance_nearest(x,y, object_index);
instance_activate_object(id);
if(instance_exists(near) and (distance(near, id) < string_width(string_hash_to_newline(text))or distance(near, id) < string_height(string_hash_to_newline(text))))
{
    if(near.x == x)
    {
        x -= sign(near.id - id);
    }
    else
    {
        x -= sign(near.x - x);
    }
}

ttl -= 1;
if(ttl<=0)
{
    instance_destroy();
}

