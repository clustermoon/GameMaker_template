/// @description 
randomize();

global.NetworkIp = "127.0.0.1";
global.NetworkPort = 6230;
global.NetworkMaxClients = 4;

network_set_config(network_config_connect_timeout, 3000);

is_server = false;

// Data types
enum eData {
		initData,
		playerUpdate,
		playerJoined
}

// Connected clients
clients = ds_list_create();


