Config.reals[?"show_alerts"] = !Config.reals[?"show_alerts"]
opt = "ON"
if(Config.reals[?"show_alerts"] == false)
{
    opt = "OFF"
}
text = "Show Enemy Alerts ["+opt+"]"
config_save()

