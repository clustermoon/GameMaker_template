function host_game(){
	show_debug_message("Host button clicked");
	data = ds_map_create();
	
	ds_map_add(data, "hostNumber", noone);
	ds_map_add(data, "playerNumber", noone);
	
	send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.create_host);

	global.NetworkIsHostStop = false;
	global.NetworkShouldHostStop = false;

	global.NetworkIsHost = true;

	room_goto(rmLobby);
}