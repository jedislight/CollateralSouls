{
    var puddle_chance = 0.25;
    var grasses_chance = 0.25;
    var dirt_chance = 0.25;
    var pillar_chance = 0.25;
    var teleporter_chance = 0.75;
    
    if(random_range(0.0,1.0) < pillar_chance)
    {
        repeat(irandom_range(5,20))
        {
            paint_pillar();
        }
    }
    
    if(random_range(0.0,1.0) < puddle_chance)
    {
        paint_puddles();
    }
    
    if(random_range(0.0,1.0) < dirt_chance)
    {
        paint_dirt();
    }
    
    if(random_range(0.0,1.0) < grasses_chance)
    {
        paint_grasses();
    }
    
    if(random_range(0.0,1.0) < teleporter_chance)
    {
        paint_teleporter();
    }
}
