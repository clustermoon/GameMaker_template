function player_send_inputs(){
	var data = ds_map_create();
	
	ds_map_add(data, "hVel", hVel);
	ds_map_add(data, "vVel", vVel);
	ds_map_add(data, "x", x);
	ds_map_add(data, "y", y);
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	ds_map_add(data, "playerNumber", global.NetworkPlayerNumber);
	
	send_map_udp(global.NetworkIp, global.NetworkPort, 1000, data, eNetworkMsgType.set_player_state);
}