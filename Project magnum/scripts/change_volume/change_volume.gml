function change_volume(){
	switch(audio_group_name(argument0)){
		case "audiogroup_default":
			//show_debug_message(argument1);
			audio_group_set_gain(audiogroup_default, argument1, 250);
		break;
		case "audiogroup_soundeffects":
			//show_debug_message(argument1);
			audio_group_set_gain(audiogroup_soundeffects, argument1, 250);
		break;
		case "audiogroup_music":
			//show_debug_message(argument1);
			audio_group_set_gain(audiogroup_music, argument1, 250);
		break;
	}
}