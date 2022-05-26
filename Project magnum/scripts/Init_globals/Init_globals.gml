function Init_globals(){

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
			select
		};
		global.Input = array_create(14);
	#endregion

	#region | Camera
		global.Camera = view_camera[0];
		global.CameraWidth = display_get_width()/2;
		global.CameraHeight =display_get_height()/2;
		global.CameraZoom = 960/global.CameraWidth; 
		global.CameraShake = 0; 
	#endregion

	#region | Game Control
		global.Pause = false;		// Boolean used to pause the game while running.
		global.Freeze = false;		// Will Stop Managers and code from being run. DEBUG USE ONLY.
	
	#endregion

	#region | Changable settings
		global.NewInputSetting = false;
	#endregion 


}



