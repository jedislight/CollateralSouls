/// @description log_message(msg)
/// @param msg
{
    var msg = string(argument0) + "#";
    show_debug_message(msg);
    Log.text = msg + Log.text;
}
