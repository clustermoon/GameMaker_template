function connect_to_game(){
	global.NetworkServer = network_create_socket(network_socket_tcp);
	var res = network_connect(global.NetworkServer, global.NetworkIp, global.NetworkPort);
	
	if(res < 0){
		show_error("Could not connect to Server.", false);	
	}else{
		show_debug_message("Connected to server!");
		room_goto(rmTestGrounds);
	}
}