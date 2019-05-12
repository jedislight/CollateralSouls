reals = ds_map_create();
strings = ds_map_create();

reals[?"wait_on_fx"] = 0;
reals[?"HP_Bar_Color_Shift"] = 1
reals[?"Debug_Logging"] = 1
reals[?"Smooth_Rendering"] = 1
reals[?"Draw_FoW"] = 1
reals[?"session_num"] = 0;
reals[?"first_lore"] = 1;
reals[?"show_bar_values"] = 1.0;
reals[?"bright_mod"] = 1.0;
reals[?"show_alerts"] = 1.0;
reals[?"full_screen"] = 0.0;
reals[?"vi_keyboard"] = 0.0;
reals[?"collapse_event"] = 1.0;

strings[?"user_id"] = sha1_string_utf8( date_datetime_string(date_current_datetime()) + string(current_time))
strings[?"last_used_name"] = "Player";
strings[?"tileset"] = "tileset_Sprite.png";

