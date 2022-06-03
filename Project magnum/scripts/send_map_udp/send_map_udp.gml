function send_map_udp(ip, port, size, map, type){
	network_connect_raw(global.NetworkSocket, ip, port);
	var buffer = buffer_create(size, buffer_fixed, size);
	
	ds_map_add(map, "type", type);
	var dataJson = json_encode(map);
	show_debug_message(" > " + dataJson);
	ds_map_destroy(map);
	
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_text, dataJson);
	network_send_udp_raw(global.NetworkSocket, ip, port, buffer, buffer_tell(buffer));
}