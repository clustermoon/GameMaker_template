function Init_globals(){


}

function init_globals_camera(){
	#region | Camera
		global.Camera = view_camera[0];
		global.CameraWidth = display_get_width()/2;
		global.CameraHeight =display_get_height()/2;
		global.CameraZoom = 960/global.CameraWidth; 
		global.CameraShake = 0; 
	#endregion
	
}


