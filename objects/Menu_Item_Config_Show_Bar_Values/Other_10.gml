Config.reals[?"show_bar_values"] = !Config.reals[?"show_bar_values"]
opt = "ON"
if(Config.reals[?"show_bar_values"] == false)
{
    opt = "OFF"
}
text = "Show Exact Values ["+opt+"]"
config_save()

