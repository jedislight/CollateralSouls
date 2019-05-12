Config.reals[?"Debug_Logging"] = !Config.reals[?"Debug_Logging"]
opt = "ON"
if(Config.reals[?"Debug_Logging"] == false)
{
    opt = "OFF"
}
text = "Debug Logging ["+opt+"]"
config_save()

