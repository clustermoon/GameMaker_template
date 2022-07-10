/// @description

//application_surface_enable(false);
//view_surf = -1;

#region | Globals

	global.Camera = view_camera[0];
	global.CameraWidth = display_get_width()/2;
	global.CameraHeight =display_get_height()/2;
	global.CameraZoom = 960/global.CameraWidth; 
	global.CameraShake = 0; 

#endregion


View_Target = oPlayer;

gotoX = 0;
gotoY = 0;


