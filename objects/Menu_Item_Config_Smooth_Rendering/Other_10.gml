Config.reals[?"Smooth_Rendering"] = !Config.reals[?"Smooth_Rendering"]
opt = "ON"
if(Config.reals[?"Smooth_Rendering"] == false)
{
    opt = "OFF"
}
text = "Smooth Rendering ["+opt+"]"
config_save()

