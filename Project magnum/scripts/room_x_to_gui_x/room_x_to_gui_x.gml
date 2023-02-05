///@description room_x_to_gui_x
///arg x
//Translates the given X Coordinate in the room to a GUI X Coordinate

function room_x_to_gui_x(){
	var _x = argument0;
	var _gui_x = undefined;

	var _cam_x = camera_get_view_x(view_camera[0]);
	var _dist = (_x - _cam_x) / global.CameraZoom;

	_gui_x = _dist;

	return _gui_x;
}