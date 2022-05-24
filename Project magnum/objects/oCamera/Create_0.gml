/// @description 
application_surface_enable(false);

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

gotoX = 0;
gotoY = 0;
view_surf = -1;


