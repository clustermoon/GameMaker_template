/// @description 
var type = async_load[? "type"];

if(type == network_type_connect){
	
	//loop through all clients and let them know a new player has joined?
	
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
	
	// Let other clients know
	var buffer = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(buffer, buffer_u8, eData.playerJoined);
	buffer_write(buffer, buffer_u8, plr.player_id);
	
	for (var i=0; i<ds_list_size(clients); i++) {
		var soc = clients[| i];
		
		if (soc < 0) continue;
		
		network_send_packet(soc, buffer, buffer_get_size(buffer));
	}
	
	buffer_delete(buffer);
	
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
		// As server, forward position to other clients
		if (is_server) {
			for (var i=0; i<ds_list_size(clients); i++) {
				var soc = clients[| i];
				
				// Make sure socket is not the one that sent the position
				if (soc < 0 || soc == async_load[? "buffer"]) continue;
				
				network_send_packet(soc, buffer, buffer_get_size(buffer));
			}
		}
	}else if(data == eData.playerJoined){
		var inst = instance_create_depth(0, 0, depth, oPlayer);
		
		inst.player_id = buffer_read(buffer, buffer_u8);
		inst.is_local = false;
	}
}




