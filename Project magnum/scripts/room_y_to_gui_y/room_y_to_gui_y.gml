///@description room_y_to_gui_y
///arg y
//Translates the given Y Coordinate in the room to a GUI Y Coordinate

function room_y_to_gui_y(){
	var _y = argument0;
	var _gui_y = undefined;

	var _cam_y = camera_get_view_y(view_camera[0]);
	var _dist = (_y - _cam_y) / global.CameraZoom;

	_gui_y = _dist;

	return _gui_y;
}