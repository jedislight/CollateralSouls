Config.reals[?"vi_keyboard"] = !Config.reals[?"vi_keyboard"]
opt = "ON"
if(Config.reals[?"vi_keyboard"] == false)
{
    opt = "OFF"
}
text = "VI Keyboard ["+opt+"]"
config_save()

