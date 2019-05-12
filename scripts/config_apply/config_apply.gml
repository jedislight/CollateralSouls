{
    var config_full = Config.reals[?"full_screen"] != 0;
    window_full = window_get_fullscreen();
    if(config_full != window_full)
    {
        window_set_fullscreen(config_full);
    }
}
