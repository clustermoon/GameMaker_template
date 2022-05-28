/// @description 
var type = async_load[? "type"];

if(type == network_type_connect){
	var socket = async_load[? "socket"];	
	
	var buffer = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(buffer, buffer_u8, eData.initData);
	buffer_write(buffer, buffer_u8, ds_list_size(clients));
	
	network_send_packet(socket, buffer, buffer_get_size(buffer));
	buffer_delete(buffer);
	
	//Create other player instances
	var plr = instance_create_depth(92, 92, depth, oPlayer);
	plr.player_id = ds_list_size(clients);
	plr.is_local = false;
	
	ds_list_add(clients, socket);
	
}else if(type == network_type_data){
	var buffer = async_load[? "buffer"];	
	
	buffer_seek(buffer, buffer_seek_start, 0);
	
	var data = buffer_read(buffer, buffer_u8);
	
	if(data == eData.initData){
		var count = buffer_read(buffer, buffer_u8);
	
		//	set your own player id
		oPlayer.player_id = count;
		
		// create other players
		for(var i=0; i < count; i ++){
			var plr = instance_create_depth(92, 92, depth, oPlayer);
			plr.player_id = i;
			plr.is_local = false;
		}
	}else if(data == eData.playerUpdate){
		var pID = buffer_read(buffer, buffer_u8);
		
		with(oPlayer){
			if(pID == player_id){
				x = buffer_read(buffer, buffer_s16);
				y = buffer_read(buffer, buffer_s16);
			}
		}
	}
}




