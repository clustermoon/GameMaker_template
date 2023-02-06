/// @description 
enum eNetworkMsgType {
	debug,
	create_host, 
	join_host, 
	stop_host,
	set_player_state,
	get_host,
	leave_host,
	get_player_state,
	get_new_players	

}


port = 59975;
max_clients = 12;

network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);

socket_list = ds_list_create();

