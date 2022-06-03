/// @description Initialize the project

wait_time = 3.5;
width = display_get_width()/2;//960;
height = display_get_height()/2;//540;

window_set_size(width, height);

angle = 0;
zoom = 1;

//Spawn Managers


manager_list = [oManager_camera, oManager_system, oManager_input, oManager_menu, oManager_sound];


for(var i = 0; i < array_length(manager_list); i++){
	instance_create_depth(x, y, depth, manager_list[i]);
	show_debug_message(string(i) + " : " + "Initialized " + string(object_get_name(manager_list[i])) +"!");
}


