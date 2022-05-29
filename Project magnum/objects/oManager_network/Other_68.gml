/// @description 
if(is_server){
	#region | Server Side
		var type = async_load[? "type"];

		switch(type){
			case network_type_connect:
				var soc = async_load[? "socket"];
				ds_list_add(clients, soc);
			break;
	
			case network_type_disconnect:
				var soc = async_load[? "socket"];
				ds_list_delete(clients, ds_list_find_index(clients, soc))
			break;
	
			case network_type_data:
				//server_data();
				
				var packet = async_load[? "buffer"];
				buffer_seek(packet, buffer_seek_start, 0);
	
				var packet_id = buffer_read(packet, buffer_u8);
	
				switch(packet_id){
					case eNetwork.move:
								var player_x  =			buffer_read(packet, buffer_s16);

					break;
				}
				
			break;
		}
#endregion 
}else{
	#region | Client Side	
	/*
		var packet = async_load[? "buffer"];
		buffer_seek(packet, buffer_seek_start, 0);
	 
		var packet_id = buffer_read(packet, buffer_u8);
	
		switch(packet_id){
			case eNetwork.move:
				var player_id = buffer_read(packet, buffer_u16);
				var find_player = ds_map_find_value(player_instances, player_id);
			
				if(is_undefined(find_player)){
					var p = instance_create_depth(random(room_width), random(room_height), depth, oPlayer);
					ds_map_add(player_instances, player_id, p);
				}else{
					if(idd != player_id) && (instance_exists(find_player)){
						var player_x = buffer_read(packet, buffer_s16);	
						var player_y = buffer_read(packet, buffer_s16);
					
						find_player.x = player_x;
						find_player.y = player_y;
					}
				}
			break;
		}
		*/

	#endregion
}