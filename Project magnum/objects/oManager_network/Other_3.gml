if(global.NetworkIsHost){
	stop_host();
	
}else if(global.NetworkIsConnected){
	var data = ds_map_create();
	ds_map_add(data, "hostNumber", oManager_menu.network_cursor);
	ds_map_add(data, "playerNumber", noone);
	send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.leave_host);
}
