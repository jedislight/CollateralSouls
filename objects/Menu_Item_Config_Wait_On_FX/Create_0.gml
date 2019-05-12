event_inherited()
opt = "ON"
if(Config.reals[?"wait_on_fx"] == false)
{
    opt = "OFF"
}
text = "Wait on FX ["+opt+"]"
detail = "Controls game flow - if ON user input will not be accepted until all special FX have finished player. Helps reduce lag and running into a deathtrap while spamming movement"

