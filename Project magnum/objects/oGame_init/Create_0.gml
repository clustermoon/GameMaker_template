/// @description Initialize the project

#region | Globals

	global.DisplayWidth				= display_get_width();
	global.DisplayHeight			= display_get_height();

	global.WindowWidth_real			= window_get_width();
	global.WindowHeight_real		= window_get_height();

	global.WindowWidth_target		= global.DisplayWidth/2;
	global.WindowHeight_target		= global.DisplayHeight/2;

#endregion

#region | Screen Settings

	window_set_size(global.WindowWidth_target, global.WindowHeight_target);
	window_center();
	
#endregion

#region | Initializing Managers

	// The Manager Array. Add Objects here to init an object at runtime.
	var _managerArray = [
		oManager_system,
		oManager_camera,
		oSplashScreen,
		oManager_input,
		oManager_sound
	];

	// Creates all objects in _managerArray
	for(var i = 0; i < array_length(_managerArray); i++){
		if(!instance_exists(_managerArray[i])){
			instance_create_depth(0, 0, 0, _managerArray[i]);
		}
	}
	
#endregion
