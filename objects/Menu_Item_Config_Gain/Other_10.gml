var mixer = Simulation.music_mixer;
var oldValue = mixer.targetGain[mixer.debug_selected_track];
var changeBy = 0.1;
if (keyboard_check_direct(vk_shift))
{
	changeBy *= -1;
}
var newValue = oldValue + changeBy;
if (newValue < 0.0){newValue += 1.0}
if (newValue > 1.0){newValue -= 1.0}
mixer.targetGain[mixer.debug_selected_track] = newValue;

