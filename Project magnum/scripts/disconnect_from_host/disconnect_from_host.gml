function disconnect_from_host(){	
	data = ds_map_create();
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	
	send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.stop_host);

	if(room != rmMain){ room_goto(rmMain); }
	if(global.Pause != false){ global.Pause = false; }
}