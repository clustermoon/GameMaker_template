function received_packet(buffer, socket){
	msgid = buffer_read(buffer, buffer_u8);
	switch(msgid){
		case eNetworkMsgType.debug:
			var msg = buffer_read(buffer, buffer_string);
			show_debug_message("< " + string(msg));
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
	
			buffer_write(server_buffer, buffer_u8, eNetworkMsgType.debug);
			buffer_write(server_buffer, buffer_string, msg);
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
	
			break;
		
		case eNetworkMsgType.create_host:

			break;
		
	}

}