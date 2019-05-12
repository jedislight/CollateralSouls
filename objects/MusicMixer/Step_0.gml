// apply dynamics
for(var i = 0; i < 5; ++i)
{
    audio_sound_gain(tracks[i], targetGain[i], 500);
}

// adjust dynamics
if (instance_number(Menu_Item_Config_Debug_Selected_Mix_Track) == 1)
{
	exit;
}

var player = instance_find(Player, 0);
if(instance_exists(player))
{
    var ratio = player.fighter.hp / player.fighter.hp_max;
    var inverse = 1.0 - ratio;
    var dampened = inverse * inverse * inverse * inverse;
    targetGain[4] = dampened;
}
else
{
    targetGain[4] = 0;
}

