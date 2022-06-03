/// @description Initilize Camera
//----------------------------------------------------------------------------------
#region | Camera vars

	//Initilize view

	global.Camera = view_camera[0];
	global.CameraWidth = display_get_width()/8;
	global.CameraHeight = display_get_height()/8;
	
	if(instance_number(oPlayer) > 1){
		for(var i = 0; i < instance_number(oPlayer); i++){
			var _inst = instance_find(oPlayer, i);
			if(_inst.is_local = true){
					View_Target = _inst;
			}
		}
	}else{ View_Target = oPlayer; }
		
	//Camera additions 

	global.CameraZoom = 960/global.CameraWidth;
	global.CameraShake = 0;
	
	view_enabled = true;
	view_visible[global.Camera] = true;
	view_xport[global.Camera] = 0;
	view_yport[global.Camera] = 0;
	view_wport[global.Camera] = global.CameraWidth + 1;
	view_hport[global.Camera] = global.CameraHeight + 1;
	
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