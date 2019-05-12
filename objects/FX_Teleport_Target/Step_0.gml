/*begin_radius = 0;
end_radius = 16;
velocity = 0;
acceleration = .5;/*/
if( radius >= end_radius )
{
    instance_destroy();
}

velocity += acceleration;
radius += velocity;

/* */
/*  */
