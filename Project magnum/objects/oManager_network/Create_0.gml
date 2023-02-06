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


global.NetworkSocket = network_create_socket(network_socket_udp);

global.NetworkPort = 59975;
global.NetworkIp =  "10.0.0.7";

global.NetworkIsHost = false;
global.NetworkIsConnected = false;

global.NetworkHostNumber = noone;
global.NetworkPlayerNumber = noone;

network_cursor = 0;
