if (!ga_enabled()){return;}
var event = ga_create_default_annotations_map();
event[?"category"] = "progression";
event[?"event_id"] = "Complete:"+string(argument0);
ga_queue_event(event);

