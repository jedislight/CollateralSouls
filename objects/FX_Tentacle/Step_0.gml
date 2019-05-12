ttl -= 1;
if(ttl <= 0)
{
    instance_destroy();
}

if(ttl >= ttl_max * 0.5)
{
    lerp_amount = (ttl_max - ttl) / ttl_max * 0.5;
}
else
{
    lerp_amount = ttl / ttl_max*0.5;
}

lerp_amount *= 4;
lerp_amount = clamp(lerp_amount, 0.0, 1.0);

var wiggle = (abs(x-tx) + abs(y-ty))*lerp_amount;
off_x2 += random_range(-wiggle, wiggle)
off_y2 += random_range(-wiggle, wiggle)
off_x3 += random_range(-wiggle, wiggle)
off_y3 += random_range(-wiggle, wiggle)
off_x4 += random_range(-wiggle, wiggle)
off_y4 += random_range(-wiggle, wiggle)

