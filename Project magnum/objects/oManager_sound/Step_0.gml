/// @description Insert description here
// You can write your code in this editor




clamp(gain_master, 0, 1);
clamp(gain_music, 0, 1);
clamp(gain_effects, 0, 1);


if(prev_gain_effects != gain_effects){
	audio_group_set_gain(audiogroup_soundeffects, gain_effects*gain_master, 0);
	prev_gain_effects = gain_effects;	
}
if(prev_gain_music != gain_music){
	audio_group_set_gain(audiogroup_music, gain_music*gain_master, 0);
	prev_gain_music = gain_music;	
}
if(prev_gain_master != gain_master){
	audio_group_set_gain(audiogroup_default, gain_master, 0);
	prev_gain_master = gain_master;	
}
/*
	audio_group_set_gain(audiogroup_soundeffects, gain_effects*gain_master, 0);

	audio_group_set_gain(audiogroup_music, gain_music*gain_master, 0);

	audio_group_set_gain(audiogroup_default, gain_master, 0);
*/

