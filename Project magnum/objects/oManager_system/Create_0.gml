/// @description 
	Init_globals();

	if display_get_timing_method() != tm_countvsyncs{
		display_set_timing_method(tm_countvsyncs);
		if display_get_sleep_margin() != 10{
		    display_set_sleep_margin(10);
		 }
	}
	
//Target Fps & Delta
game_set_speed(60, gamespeed_fps);

global.MultiplayerGame = true;


