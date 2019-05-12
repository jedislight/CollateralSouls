/// @description ga_progression_start_event(progression_string)
/// @param progression_string
if (!ga_enabled()){return;}
var event = ga_create_default_annotations_map();
event[?"category"] = "progression";
event[?"event_id"] = "Start:"+string(argument0);
ga_queue_event(event);

