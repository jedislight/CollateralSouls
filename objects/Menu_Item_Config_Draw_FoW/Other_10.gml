Config.reals[?"Draw_FoW"] = !Config.reals[?"Draw_FoW"]
opt = "ON"
if(Config.reals[?"Draw_FoW"] == false)
{
    opt = "OFF"
}
text = "Draw Fog of War ["+opt+"]"
config_save()

