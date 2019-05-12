//gain_xp(fighter, amount)
{
    var fighter = argument0;
    var amount = argument1;
    
    Simulation.last_xp_gain = fighter.owner.turns_taken;
    
    var modifier = 1.0;
    if(perk_exists(fighter.owner, Perk_Insightfull))
    {
        modifier += perk_get(fighter.owner, Perk_Insightfull).value;
    }
    if(perk_exists(fighter.owner, Perk_Open_Minded))
    {
        modifier += perk_get(fighter.owner, Perk_Open_Minded).xp_boost;
    }
    var less_xp_condition = condition_get(Condition_Less_XP);
    if(instance_exists(less_xp_condition))
    {
        modifier *= less_xp_condition.value;
    }
    fighter.xp += amount * modifier;
    if(fighter.xp >= fighter.next_level)
    {
        if(fighter.owner.object_index == Player)
        {
            log_history("+", c_white);
            ga_design_value_event("player:level_up", fighter.level + 1);
        }
        fighter.level += 1;
        fighter.prev_level = fighter.next_level;
        fighter.next_level += fighter.level * 10;
        var hp_gain = 5;
        var damage_gain = 1;
        var accuracy_gain = 0.1;
        var armor_gain = 0.025;
        
        if(perk_exists(fighter.owner, Perk_Background_Simple))
        {
            hp_gain *= 2;
            damage_gain *= 2;
            accuracy_gain *= 2;
            armor_gain *= 2;
        }
        if(perk_exists(fighter.owner, Perk_Background_Scholar))
        {
            hp_gain = 0;
            damage_gain = 0;
            accuracy_gain = 0;
            armor_gain = 0;
        }
        if(perk_exists(fighter.owner, Perk_Background_Survivor))
        {
            hp_gain *= 2;
            damage_gain *= 0.5;
        }
        if(perk_exists(fighter.owner, Perk_Background_Slayer))
        {
            hp_gain *= 0.5;
            damage_gain *= 2;
        }
        
        fighter.hp += hp_gain;
        fighter.hp_max += hp_gain;
        fighter.damage += damage_gain;
        fighter.ranged_damage += damage_gain;
        fighter.accuracy += accuracy_gain;
        fighter.ranged_accuracy += accuracy_gain;
        fighter.armor += armor_gain;
        
        log_message(fighter.owner.name + " has achived level " + string(fighter.level));
        if(perk_exists(fighter.owner, Perk_Background_Simple))
        {
            return 0;
        }
        
        open_new_perk_menu();
    }
}
