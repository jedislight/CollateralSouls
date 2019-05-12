Config.reals[?"wait_on_fx"] = !Config.reals[?"wait_on_fx"]
opt = "ON"
if(Config.reals[?"wait_on_fx"] == false)
{
    opt = "OFF"
}
text = "Wait on FX ["+opt+"]"
config_save()

