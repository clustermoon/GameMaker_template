/// @description controlling non local players


if(async_load[? "size"] > 0){
	var c_rec_buff = async_load[? "buffer"];
	buffer_seek(c_rec_buff, buffer_seek_start, 0);
	var message_id = buffer_read(c_rec_buff, buffer_string);
	
	var response = json_decode(message_id);
	
	if(ds_map_find_value(response, "type" ) == eNetworkMsgType.get_player_state){
		show_debug_message("< " + message_id);
		var playerStates = ds_map_find_value(response, "playerStates");
		if(ds_map_find_value(playerStates, "playerNumber") != undefined){
			var pN = ds_map_find_value(playerStates, "playerNumber");
			if(pN == playerNumber){
				hKey		= ds_map_find_value(playerStates, "hKey");
				vKey		= ds_map_find_value(playerStates, "vKey");
				x			= ds_map_find_value(playerStates, "x");
				y			= ds_map_find_value(playerStates, "y");
			}
		}
		
	}
	
}

