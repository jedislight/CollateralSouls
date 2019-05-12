music_sync_group = audio_create_sync_group(true);
tracks[0] = audio_play_in_sync_group(music_sync_group, sound0_Angelic);
tracks[1] = audio_play_in_sync_group(music_sync_group, sound1_Bass);
tracks[2] = audio_play_in_sync_group(music_sync_group, sound2_Core);
tracks[3] = audio_play_in_sync_group(music_sync_group, sound3_Demonic);
tracks[4] = audio_play_in_sync_group(music_sync_group, sound4_Tension);

debug_track_names[0] = "Angelic";
debug_track_names[1] = "Bass";
debug_track_names[2] = "Core";
debug_track_names[3] = "Demonic";
debug_track_names[4] = "Tension";

debug_selected_track = 0;
debug_track_count = 5;

targetGain[0] = 0;
targetGain[1] = 1;
targetGain[2] = 0;
targetGain[3] = 0;
targetGain[4] = 0;

audio_sound_gain(tracks[0], 0, 0);
audio_sound_gain(tracks[1], 0, 0);
audio_sound_gain(tracks[2], 0, 0);
audio_sound_gain(tracks[3], 0, 0);
audio_sound_gain(tracks[4], 0, 0);

audio_start_sync_group(music_sync_group);

