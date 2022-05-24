/// @description Initialize the project

wait_time = 3.5;
width = display_get_width()/2;//960;
height = display_get_height()/2;//540;

window_set_size(width, height);

angle = 0;

//Spawn Managers
manager_list = [oManager_system, oManager_input, oManager_network, oManager_menu];
for(var i = 0; i < array_length(manager_list); i++){
	instance_create_depth(x, y, depth, manager_list[i]);
	show_debug_message("Initialized " + string(object_get_name(manager_list[i])) +"!");
}

