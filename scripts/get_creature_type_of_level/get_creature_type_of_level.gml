{
    var level = argument0;
    
    switch(level)
    {
        case 1: return choose(Zombie, Imp);
        case 2: return choose(Latern_Archon, Hound_Archon, Queen);
        case 3: return choose(Demon_Soldier, Wraith);
        case 4: return choose(Seraph, Arch_Angel, Mound);
        case 5: return choose(Fiend, Purifier);
        case 6: return choose(Reaper, Carnage);
        default: return choose(Reaper, Carnage);
    }
}
