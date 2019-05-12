hspeed *= .9
vspeed -= 0.1
alpha *= .90
if(alpha < 0.1)
{
    instance_destroy();
}

