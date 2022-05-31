/// @description 
global.NetworkPort = 59975;
global.NetworkIp =  "127.0.0.1";
		
global.NetworkSocket = network_create_socket(network_socket_udp);

network_connect_raw(global.NetworkSocket, global.NetworkIp, global.NetworkPort);



