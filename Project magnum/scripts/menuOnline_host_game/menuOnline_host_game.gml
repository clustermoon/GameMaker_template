function menuOnline_host_game(){
		show_debug_message("Host button clicked");
		data = ds_map_create();
	
		global.NetworkIsHost = true;
	
		ds_map_add(data, "hostnumber", noone);
		ds_map_add(data, "playernumber", noone);
		
		send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.create_host);
	
}

