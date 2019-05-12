if (!ga_enabled()){return;}
var event = ga_create_default_annotations_map();
event[?"category"] = "session_end";
event[?"length"] = round((current_time - Analytics.session_start)*1000);
ga_queue_event(event);

