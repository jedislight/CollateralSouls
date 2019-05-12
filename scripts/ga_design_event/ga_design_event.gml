/// @description ga_design_event(event_id)
/// @param event_id
if (!ga_enabled()){return;}
var event = ga_create_default_annotations_map();
event[?"category"] = "design";
event[?"event_id"] = argument0;
ga_queue_event(event);

