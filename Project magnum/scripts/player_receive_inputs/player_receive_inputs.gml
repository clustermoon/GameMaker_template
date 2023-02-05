function player_receive_inputs(){
	var data = ds_map_create();
	
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	ds_map_add(data, "playerNumber", player_number);
	ds_map_add(data, "playerState", noone);
	
	send_map_udp(global.NetworkIp, global.NetworkPort, 300, data, eNetworkMsgType.get_player_state);
}
