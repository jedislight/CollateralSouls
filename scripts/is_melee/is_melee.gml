//is_melee(object1, object2)
{
    var object1 = argument0;
    var object2 = argument1;
    var x_melee = abs(object1.x - object2.x) <= 1;
    var y_melee = abs(object1.y - object2.y) <= 1;
    
    return x_melee and y_melee;
}
