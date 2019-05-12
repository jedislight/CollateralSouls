event_inherited();
description = "Your enemies have clever tactics"
with(Creature)
{
    fighter.level += 1;
    ds_list_shuffle(Simulation.perks);
    for (var i = 0; i < ds_list_size(Simulation.perks); ++i)
    {
        if(perk_is_available(id, Simulation.perks[|i]))
        {
            perk_grant(id, Simulation.perks[|i]);
            break;
        }
    }
}

