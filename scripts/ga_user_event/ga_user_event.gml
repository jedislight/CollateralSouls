if (!ga_enabled()){return;}
var event = ga_create_default_annotations_map();
event[?"category"] = "user";
ga_queue_event(event);

