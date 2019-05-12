Config.reals[?"bright_mod"] = Config.reals[?"bright_mod"] - 0.1;
if(Config.reals[?"bright_mod"] < 0.5)
{
    Config.reals[?"bright_mod"] = 1.5;    
}
opt = string(100+floor(100*(1.0-Config.reals[?"bright_mod"]))) + "%";
text = "Brightness ["+opt+"]"
config_save()

