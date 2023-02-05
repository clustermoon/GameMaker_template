/// @description 
// Inherit the parent event
event_inherited();

size = 100;
percent = 100;
testSnd = sndTest_master;


switch(audio_group_name(arg)){
	case "audiogroup_default":
		testSnd = sndTest_master;
	break;
	case "audiogroup_soundeffects":
		testSnd = sndTest_soundeffects;
	break;
	case "audiogroup_music":
		testSnd = sndTest_music;
	break;
}
	

xx = x+((percent)-size/2)
yy = y;



image_xscale = size/2;
image_yscale = 3;
