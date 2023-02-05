/// @description Insert description here
// You can write your code in this editor


if(!inputting){
	switch(audio_group_name(arg)){
		case "audiogroup_default":
			if(!place_meeting(x, y, oCursor)){
				if(audio_sound_get_gain(sndTest_master) < 1){   percent = audio_sound_get_gain(sndTest_master); xx = x+((percent*100)-size/2); }
			}
			testSnd = sndTest_master;
		break;
		case "audiogroup_soundeffects":
			if(!place_meeting(x, y, oCursor)){
				if(audio_sound_get_gain(sndTest_soundeffects) < 1){percent = audio_sound_get_gain(sndTest_soundeffects); xx = x+((percent*100)-size/2);  }	
			}
			testSnd = sndTest_soundeffects;
		break;
		case "audiogroup_music":
			if(!place_meeting(x, y, oCursor)){
				if(audio_sound_get_gain(sndTest_music) < 1){percent = audio_sound_get_gain(sndTest_music); xx = x+((percent*100)-size/2);  }
			}
			testSnd = sndTest_music;
		break;
	}
}








