/// @description 
if(async_load[? "size"] > 0){
	var buff = async_load[? "buffer"];
	buffer_seek(buff, buffer_seek_start, 0);
	var msdID = buffer_read(buff, buffer_string);
	var response = json_decode(msdID);
	
	// ------------------------------------------------------------------- DEBUG 
	if(ds_map_find_value(response, "type") == eNetworkMsgType.debug){
		var msg = ds_map_find_value(response, "message");
		show_debug_message("> " + string(msg));
	}
	
	//--------------------------------------------------------------------- CREATE HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.create_host){
		var hostnumber = ds_map_find_value(response, "hostnumber");
		var playernumber = ds_map_find_value(response, "playernumber");
			
		global.NetworkHostNumber = hostnumber;
		global.NetworkPlayerNumber = playernumber;
		
		show_debug_message("Created host #" + string(hostnumber) + " with " + string(playernumber) + " players");
		room_goto(rmLobby);
		//var _xx = 200, _yy = 300;
		//instance_create_depth(_xx, _yy, eInstanceDepth.mid, oPlayer);
	}
	
	//--------------------------------------------------------------------- Stop HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.stop_host){
		var res = ds_map_find_value(response, "res");
		if(res == "stopped"){
			global.NetworkIsHostStop = true;
			global.Pause = false;
			room_goto(rmMain); 
		}
	}
}