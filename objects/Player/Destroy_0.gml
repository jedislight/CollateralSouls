while(get_active_menu() != noone)
{
    pop_active_menu();
}

var message = " has perished";
if(floors_covered == Simulation.final_floor)
{
    ga_progression_complete_event("Floor" + string(round(floors_covered)));
}
else
{
    log_history("X", c_red);
    ga_progression_fail_event("Floor" + string(round(floors_covered)));
}

var menu = floor_score_update();
var points = get_game_score_total();
ga_design_value_event("player:final_score", points);
highscore_add(name, points);
if(instance_number(Actor) >= 1)
{
    actor_delete();
    Actor.best_score = max(Actor.best_score, points);
    Actor.runs += 1;
    actor_save();
}

log_message(name + "'s final score was " + string(points));

if(Config.reals[?"Debug_Logging"])
{
    var f = file_text_open_write(name + ".debug_log");
    file_text_write_string(f, Log.text);
    file_text_close(f);   
}

ds_list_destroy(history)
with(Analytics)
{
    event_perform(ev_alarm, 0);
}

event_inherited();

