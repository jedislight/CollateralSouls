/// @description new_perk(perk, owner)
/// @param perk
/// @param  owner
{
    var perk = argument0;
    var owner = argument1;
    var p = instance_create(0,0, perk);
    p.owner = owner;
    return p;
}
