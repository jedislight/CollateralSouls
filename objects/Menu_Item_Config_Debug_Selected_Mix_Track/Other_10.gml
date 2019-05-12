var mixer = Simulation.music_mixer;
var oldValue = mixer.debug_selected_track;
var changeBy = 1;
if (keyboard_check_direct(vk_shift))
{
	changeBy *= -1;
}
var newValue = oldValue + changeBy;
newValue = newValue mod mixer.debug_track_count;
mixer.debug_selected_track = newValue;

