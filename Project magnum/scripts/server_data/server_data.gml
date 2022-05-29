function server_data(){
	var packet = async_load[? "buffer"];
	buffer_seek(packet, buffer_seek_start, 0);
	
	var packet_id = buffer_read(packet, buffer_u8);
	
	switch(packet_id){
		case eNetwork.move:
			var player_id =			buffer_read(packet, buffer_u16);
			var player_x  =			buffer_read(packet, buffer_s16);
			var player_y  =			buffer_read(packet, buffer_s16);
			
			//send to other clients
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, eNetwork.move);
			buffer_write(buff, buffer_u16, player_id);
			buffer_write(buff, buffer_s16, player_x);
			buffer_write(buff, buffer_s16, player_y);
			
			//Loop through the total player list
			for(var i = 0; i < ds_list_size(clients); i++){
				network_send_packet(ds_list_find_value(clients, i), buff, buffer_tell(buff));
			}
			buffer_delete(buff);		
			
		break;
		
		case eNetwork.join :
		
		break;
		
		case eNetwork.disconnect:
		
		break;
	}
}