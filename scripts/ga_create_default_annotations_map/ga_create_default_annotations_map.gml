{
	if (!ga_enabled()){return;}
    var da = ds_map_create();
    
    var tz = date_get_timezone();
    date_set_timezone(timezone_utc);
    var local_ts = date_second_span(date_create_datetime(1970, 1, 1, 0, 0, 0), date_current_datetime()) + Analytics.local_time_offset;
    local_ts = floor(local_ts);
    date_set_timezone(tz);
            
    da[?"device"] = "unknown";
    da[?"v"] = 2;
    da[?"user_id"] = Config.strings[?"user_id"];
    da[?"client_ts"] = local_ts;
    da[?"sdk_version"] = "rest api v2";
    da[?"os_version"] = "ios 8.2";
    da[?"manufacturer"] = "unknown";
    da[?"platform"] = "windows";
    da[?"session_id"] = Analytics.session_id;    
    da[?"session_num"] = Config.reals[?"session_num"];
    return da;
}

