/// @description 
#region | Game Initilization
	declare_globals();
	get_input(InputType);

	if display_get_timing_method() != tm_countvsyncs{
		display_set_timing_method(tm_countvsyncs);
		if display_get_sleep_margin() != 10{
		    display_set_sleep_margin(10);
		 }
	}
	
	//Target Fps & Delta
	target_fps = 60
	game_set_speed(target_fps, gamespeed_fps);
	
#endregion

