function host_game(){
	global.NetworkServer = network_create_server(network_socket_tcp, global.NetworkPort, global.NetworkMaxClients);

	// Failed
	if (global.NetworkServer < 0){
		show_error("Could not create server.", false);	
	}else{
		show_debug_message("Created server!");
		room_goto(rmTestGrounds);
		is_server = true;
	}
}