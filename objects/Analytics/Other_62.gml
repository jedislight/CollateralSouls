if(enabled == false)
{
    exit;
}
if(init_request_id == async_load[? "id"])
{
    //show_debug_message("GA /init response recived");
    //show_debug_message("GA /init HTTP status:" + string(async_load[? "http_status"]))
    var json_response = async_load[? "result"];
    if(not is_string(json_response))
    {
        enabled = false;
        exit;
    }
    var response = json_decode(json_response);
    
    init_passed = (ds_map_exists(response, "enabled") and response[?"enabled"] = 1)
    //show_debug_message("GA Ready: " + string(init_passed));
    if(init_passed)
    {
        if(ds_map_exists(response, "server_ts"))
        {
            var tz = date_get_timezone();
            date_set_timezone(timezone_utc);
            var server_ts = response[?"server_ts"];
            var local_ts = date_second_span(date_create_datetime(1970, 1, 1, 0, 0, 0), date_current_datetime());
            local_time_offset = server_ts - local_ts;
            date_set_timezone(tz);
            //show_debug_message("GA Local Time Offest (seconds): " + string(local_time_offset));
            //show_debug_message("GA Session Id: " + session_id);
            //show_debug_message("GA Session Num: " + string(Simulation.config.reals[?"session_num"]));
        }
    }
    ds_map_destroy(response);
}
else if(request_id == async_load[? "id"])
{
    show_debug_message("GA /events response recived");
    show_debug_message("GA /events HTTP status:" + string(async_load[? "http_status"]))
    if(async_load[? "http_status"] != 200)
    {
        error = true;
        show_debug_message("GA /events rejection");
    }
}

