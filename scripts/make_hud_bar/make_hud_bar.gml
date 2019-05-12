/// @description make_hud_bar(label, pips, bar_size, additional_info)
/// @param label
/// @param  pips
/// @param  bar_size
/// @param  additional_info
{
    var label = argument0;
    var pips = argument1;
    var bar_size = argument2;
    var additional_info = argument3;
    if(additional_info)
    {
        additional_info = "("+string(additional_info)+")"
    }
    return string(label) + ": "+additional_info+"#["+string_repeat("/", pips)+string_repeat(" ", bar_size - pips)+"]"
}
