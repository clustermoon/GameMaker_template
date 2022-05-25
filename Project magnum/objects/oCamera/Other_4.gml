/// @description Initilize Camera
//----------------------------------------------------------------------------------
#region | Camera vars

	//Initilize view

	global.CameraMain = view_camera[0];
	global.CameraWidth = display_get_width()/8;//960;
	global.CameraHeight = display_get_height()/8;//540;
	View_Target = oTest;
		
	//Camera additions

	global.CameraZoom = 960/global.CameraWidth;
	global.CameraShake = 0;
	
	view_enabled = true;
	view_visible[global.CameraMain] = true;
	view_xport[global.CameraMain] = 0;
	view_yport[global.CameraMain] = 0;
	view_wport[global.CameraMain] = global.CameraWidth + 1;
	view_hport[global.CameraMain] = global.CameraHeight + 1;
	
	//Initilize camera
	var x_border = 400;
	var y_border = 250;
	camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, x_border, y_border);
	
	
	//Initilize display
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth/2) - global.CameraWidth/2;
	var _ypos = (_dheight/2) - global.CameraHeight/2;
	//window_set_rectangle(_xpos, _ypos, global.CameraWidth, global.CameraHeight);
	surface_resize(application_surface, global.CameraWidth, global.CameraHeight);
	display_set_gui_size(global.CameraWidth, global.CameraHeight);
	
#endregion
//---------