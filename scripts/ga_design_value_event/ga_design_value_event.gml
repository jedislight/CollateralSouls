/// @description ga_design_value_event(event_id, value);
/// @param event_id
/// @param  value
if (!ga_enabled()){return;}
var event = ga_create_default_annotations_map();
event[?"category"] = "design";
event[?"event_id"] = argument0;
event[?"value"] = argument1;
ga_queue_event(event);

