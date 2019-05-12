event_inherited()
opt = "ON"
if(Config.reals[?"Debug_Logging"] == false)
{
    opt = "OFF"
}
text = "Debug Logging ["+opt+"]"
detail = "If ON, upon death the event log will be saved to disk under the name of the current character"

