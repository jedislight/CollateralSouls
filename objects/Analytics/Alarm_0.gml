/// @description POST events
alarm[0] = room_speed * 20;

if(ds_list_size(event_queue) > 0)
{
    //send
    var body = "[";
    for(var i = 0; i < ds_list_size(event_queue); ++i)
    {
        var line_ending = ","
        if(i == ds_list_size(event_queue) - 1)
        {
            line_ending = "";
        }
        
        body += event_queue[|i] + line_ending;
    }
    body += "]";
    
    //show_debug_message("GA Post Events: " + body);
    ds_list_clear(event_queue);

    if(init_passed and not DEBUG and GA_SEND and enabled)
    {
        show_debug_message("GA POST /event")
        show_debug_message("GA Body Size: " + string(string_length(body)));
        init_headers = ds_map_create();
        init_headers[? "Host"] = GA_API;
        show_debug_message(string(init_headers[? "Host"]));
        init_headers[? "Authorization"] = ga_create_hmac_sha2(GA_SECRET, body);
        show_debug_message(string(init_headers[? "Authorization"]));
        init_headers[? "Content-Type"] = "application/json";
        show_debug_message(string(init_headers[? "Content-Type"]));
        
        var api = GA_API_HTTP + "/v2/" + GA_GAME_KEY + "/events";
        var operation = "POST";
        show_debug_message(api +" ||| "+ operation + " ||| " + body);
        request_id = http_request(api, operation, init_headers, body);
        show_debug_message("GA Events Request ID: " + string(request_id));
    }
}

