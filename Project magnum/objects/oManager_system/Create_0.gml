/// @description 
	
#region | Delta 
	global.TargetDelta					= 1/60;  
	global.DeltaReal						= delta_time/1000000;
	global.DeltaMultiplyer				= global.DeltaReal / global.TargetDelta;
#endregion 

#region | Inputs
	global.GamePad						= noone;
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
	
	global.MultiplayerGame = false;
		
#endregion

#region | Changable settings
	global.NewInputSetting = false;
#endregion 

#region | Network 
	global.NetworkSocket = noone;
	global.NetworkPort = 59975;
	global.NetworkIp =  "127.0.0.1";
		
	global.NetworkIsHost = false;
	global.NetworkIsConnected = false;
		
	global.NetworkIsHostStop = false;
	global.NetworkShouldHostStop = false;
		
	global.NetworkHostNumber = noone;
	global.NetworkPlayerNumber = noone;
		
	enum eNetworkMsgType {
		create_host, 
		join_host, 
		stop_host,
		set_player_state,
		get_host,
		leave_host
	}
		
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
