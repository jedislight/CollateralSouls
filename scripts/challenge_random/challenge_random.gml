ds_list_sort(Simulation.perks, true);
do 
{
    //Setup
    condition_set(choose(Condition_Background_Locked));
    
    //world
    condition_set(choose(Condition_Ambience,Condition_Darkness, Condition_Scale, Condition_Uniformity, noone));
    
    //player
    condition_set(choose(Condition_No_Perk_Checks, Condition_Less_XP, Condition_No_Regeneration, Condition_Weak_Player_Melee, Condition_Weak_Player_Ranged, Condition_Player_Perk));
    
    //creatures
    condition_set(choose(Condition_Strong_Creature_Ranged, Condition_Strong_Creature_Melee, Condition_Creature_Perk));    

} until(instance_number(Condition) != 0)
