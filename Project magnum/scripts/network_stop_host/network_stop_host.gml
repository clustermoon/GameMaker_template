function network_stop_host(){	
	data = ds_map_create();
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	ds_map_add(data, "res", noone);
	
	send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.stop_host);

}