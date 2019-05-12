{
    for(var xx = 8; xx < 60; xx++) for(var yy = 8; yy < 40; yy+=31)
    {
        instance_create(xx,yy,Wall)   
    }
    
    for(var xx = 8; xx < 60; xx+=51) for(var yy = 8; yy < 40; yy++)
    {
        instance_create(xx,yy,Wall)   
    }
    
    for(var xx = 9; xx < 59; xx++) for(var yy = 9; yy < 39; yy++)
    {
        if((xx == 12 or xx == 15) and (yy>10 and yy < 16))
        {
            instance_create(xx,yy,Wall)   
        }
        else
        {
            instance_create(xx,yy,Floor);
            if(xx mod yy == 2)
            {
                var l = instance_create(xx,yy, Lamp);
                l.light_color = choose(c_red, c_yellow, c_blue, c_white);
            }        
        }
    }
    
    show_debug_message("Creating debug room player");
    instance_create(10,13, Player); 
    instance_create(15,10, Mound);

    
}
