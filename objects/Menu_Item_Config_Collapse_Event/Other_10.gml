Config.reals[?"collapse_event"] = !Config.reals[?"collapse_event"]
opt = "ON"
if(Config.reals[?"collapse_event"] == false)
{
    opt = "OFF"
}
text = "Collapse Event ["+opt+"]"
config_save()

