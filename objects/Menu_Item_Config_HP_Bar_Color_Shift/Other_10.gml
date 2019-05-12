Config.reals[?"HP_Bar_Color_Shift"] = !Config.reals[?"HP_Bar_Color_Shift"]
opt = "ON"
if(Config.reals[?"HP_Bar_Color_Shift"] == false)
{
    opt = "OFF"
}
text = "HP Color Shift ["+opt+"]"
config_save()

