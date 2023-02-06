/// @description
if(global.NetworkIsHost){
	data = ds_map_create();
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	ds_map_add(data, "res", noone);
	
	send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.stop_host);	
	ds_map_destroy(data);
}else if(global.NetworkIsConnected){
	data = ds_map_create();
	ds_map_add(data, "hostNumber", network_cursor);
	ds_map_add(data, "playerNumber", noone);
	send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.leave_host);
	ds_map_destroy(data);
}
