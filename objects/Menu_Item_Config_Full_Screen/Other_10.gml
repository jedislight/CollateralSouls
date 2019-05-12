Config.reals[?"full_screen"] = !Config.reals[?"full_screen"]
opt = "ON"
if(Config.reals[?"full_screen"] == false)
{
    opt = "OFF"
}
text = "Full Screen ["+opt+"]"
config_apply();

config_save()

