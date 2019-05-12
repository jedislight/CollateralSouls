var hash = ga_create_hmac_sha2("16813a12f718bc5c620f56944e1abc3ea13ccbac", "{\"test\": \"test\"}");
//show_debug_message("DLL Call test HMAC: " + string(hash));
ga_free_hmac_sha2(hash);

//variables
init_passed = false;
init_request_id = -4;
local_time_offset = 0;
session_id = ga_generate_session_id();
event_queue = ds_list_create();
session_start = current_time
enabled = true;

//init
alarm[0] = room_speed * 20;
var init_body = ds_map_create();
init_body[? "platform"] = "windows" ;
init_body[? "os_version"] = string(os_version);
init_body[? "sdk_version"] = "rest api v2";
var init_body_json = json_encode(init_body);
ds_map_destroy(init_body);

//show_debug_message("GA POST /init")
init_headers = ds_map_create();
init_headers[? "Host"] = GA_API;
//show_debug_message(string(init_headers[? "Host"]));
init_headers[? "Authorization"] = ga_create_hmac_sha2(GA_SECRET, init_body_json);
//show_debug_message(string(init_headers[? "Authorization"]));
init_headers[? "Content-Type"] = "application/json";
//show_debug_message(string(init_headers[? "Content-Type"]));

var api = GA_API_HTTP + "/v2/" + GA_GAME_KEY + "/init";
var operation = "POST";
//show_debug_message(api +" ||| "+ operation + " ||| " + init_body_json);
init_request_id = http_request(api, operation, init_headers, init_body_json);
//show_debug_message("GA Init Request ID: " + string(init_request_id));
//ga_free_hmac_sha2(init_headers[? "Authorization"]);
//ds_map_destroy(init_headers);

//user event
ga_user_event();

