/// @description is_fightable(xx, yy)
/// @param xx
/// @param  yy
{
    var xx = argument0
    var yy = argument1
    with(Fighter_Component)
    {
        if(instance_exists(owner) and owner.x == xx and owner.y == yy)
        {
            return owner.id;
        }
    }
    
    return noone
}
