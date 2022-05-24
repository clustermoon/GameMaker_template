/// @description Initilize Camera
//----------------------------------------------------------------------------------
#region | Camera vars

	//Initilize view
	globalvar View_Width, View_Height, View, View_Target;
	View = view_camera[0];
	View_Width = display_get_width()/2;//960;
	View_Height = display_get_height()/2;//540;
	View_Target = oTest;
		
	//Camera additions
	globalvar ZoomF, ShakeMag;
	ZoomF = 960/View_Width;
	ShakeMag = 0;
	
	view_enabled = true;
	view_visible[View] = true;
	view_xport[View] = 0;
	view_yport[View] = 0;
	view_wport[View] = View_Width;
	view_hport[View] = View_Height;
	
	//Initilize camera
	var x_border = 400;
	var y_border = 250;
	camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, x_border, y_border);
	
	
	//Initilize display
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth/2) - View_Width/2;
	var _ypos = (_dheight/2) - View_Height/2;
	window_set_rectangle(_xpos, _ypos, View_Width, View_Height);
	surface_resize(application_surface, View_Width, View_Height);
	
#endregion
//---------