/// @description 

#region | Delta
	global.DeltaReal = delta_time/1000000;
	global.DeltaMultiplyer = global.DeltaReal / global.TargetDelta;
#endregion 

window_set_fullscreen(fullscreen[0]);	

if(resolution[0] != window_get_width()){
	var _ind = resolution[0];
	var _w = _ind[0];
	var _h = _ind[1];
	if(!fullscreen[0]){
		window_set_size(_w, _h);
	}
	display_set_gui_size(_w, _h);
	surface_resize(application_surface, _w, _h);
	window_center();
}





