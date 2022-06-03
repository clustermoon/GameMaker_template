/// @description
//if(!global.NetworkIsHost) exit;

if(async_load[? "size"] > 0){
	var buff = async_load[? "buffer"];
	buffer_seek(buff, buffer_seek_start, 0);
	var msdID = buffer_read(buff, buffer_string);
	
	var response = json_decode(msdID);
	
	if(ds_map_find_value(response, "type") == eNetworkMsgType.create_host){
		var hostNumber = ds_map_find_value(response, "hostNumber");
		var playerNumber = ds_map_find_value(response, "playerNumber");
	
		global.NetworkHostNumber = hostNumber;
		global.NetworkPlayerNumber = playerNumber;
	
		show_debug_message("Created host #" + string(hostNumber) + " with " + string(playerNumber) + " players");
		
	}
	
}
