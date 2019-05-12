{
	if (!ga_enabled()){return;}
    json = json_encode(argument0);
    json = string_replace_all(json, ".000000", "");
    ds_list_add(Analytics.event_queue, json);
    ds_map_destroy(argument0);
}
