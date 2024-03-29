	
#region | Delta 
	global.TargetDelta					= 1/60;  
	global.DeltaReal					= delta_time/1000000;
	global.DeltaMultiplyer				= global.DeltaReal / global.TargetDelta;
#endregion 

#region | Inputs
	global.GamePad				    = noone;
	global.CurrentInputDevice		= 0;
	enum eInputDevice {
		keyboard,
		controller
	};
	enum eInputState{
		lStick_hAxis,
		lStick_vAxis,
		rStick_hAxis,
		rStick_vAxis,
		aButton, 
		bButton, 
		xButton,
		yButton,
		rBumper,
		rTrigger,
		lBumper,
		lTrigger,
		start,
		select,
		padl,
		padr,
		padu,
		padd
	};
	global.Input = array_create(18);
#endregion

#region | Game Control
	global.Pause = false;		// Boolean used to pause the game while running.
	global.Freeze = false;		// Will Stop Managers and code from being run. DEBUG USE ONLY.
	
	global.MultiplayerGame = true;
	global.ActiveControllers = [];
	global.InMenu = false;
		
#endregion

#region | Changable settings
	global.NewInputSetting = false;
#endregion 
	
#region | Misc

	if display_get_timing_method() != tm_countvsyncs{
		display_set_timing_method(tm_countvsyncs);
		if display_get_sleep_margin() != 10{
			display_set_sleep_margin(10);
			}
	}
	
	//Target Fps & Delta
	game_set_speed(60, gamespeed_fps);


#endregion

#region | Drawing and scaling
	
	global.GUIScale = 1;
	
	alarm[0] = 1;

	aa_levels = [0, [0, 2, 4, 8]];
	vsync = [false, [true, false]];
	resolution = [[960, 540], [[480, 270], [720, 480], [960, 540], [1280, 720], [1920, 1080]]];
	fullscreen = [false, [true, false]];
	back = ["", ""];
	graphics_settings = [fullscreen, resolution, back ];

#endregion