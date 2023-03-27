/// @description 
enum eNetworkMsgType {
	debug,					//0
	create_host,			//1
	join_host,				//2
	stop_host,				//3
	set_player_state,		//4
	get_host,				//5
	leave_host,				//6
	get_player_state,		//7
	get_new_players			//8

}


global.NetworkPort = 59975;
global.NetworkIp =  "10.0.0.7";

global.NetworkSocket = network_create_socket(network_socket_tcp);

global.NetworkIsHost = false;
global.NetworkIsConnected = false;

global.NetworkIsHostStop = false;
global.NetworkShouldHostStop = false;

global.NetworkHostNumber = noone;
global.NetworkPlayerNumber = noone;

attemptJoin = false;
joinSucceed = false;

attemptLeave = false;
leaveSucceed = false;

recievedHosts = false;
retrieveHosts = true;

number_of_hosts = 0;
number_of_players = 0;

network_cursor = 0;


