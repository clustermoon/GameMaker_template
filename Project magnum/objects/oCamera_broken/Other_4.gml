/// @description Initilize Camera
//----------------------------------------------------------------------------------
#region | Camera vars

	//Initilize view
	View_Target = oTest;
		
	//Camera additions
	if(global.CameraZoom != global.CameraZoom_base){ global.CameraZoom = 960/global.CameraWidth; }
	if(global.CameraShake != global.CameraShake_base){ global.CameraShake = 0; }
	
	//Initilize display
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth/2) - global.CameraWidth/2;
	var _ypos = (_dheight/2) - global.CameraHeight/2;
	window_set_rectangle(_xpos, _ypos, global.CameraWidth, global.CameraHeight);
	surface_resize(application_surface, global.CameraWidth, global.CameraHeight);
	display_set_gui_size(global.CameraWidth, global.CameraHeight);
	
	
#endregion
//---------