/// @description 
global.NetworkPort = 59975;
global.NetworkIp =  "127.0.0.1";
global.NetworkSocket = network_create_socket(network_socket_udp);


recievedHosts = false;
retrieveHosts = true;

number_of_hosts = 0;
number_of_players = 0;