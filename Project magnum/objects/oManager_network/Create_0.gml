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

enum eNetwork {
	join,
	move,
	disconnect
}

// Connected clients
clients = ds_list_create();

player_instances = ds_map_create();

idd = 0;
Player = instance_create_depth(x, y, depth, oPlayer);
idd = Player.player_id;

ds_map_add(player_instances, idd, Player);

