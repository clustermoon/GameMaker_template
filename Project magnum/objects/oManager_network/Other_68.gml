/// @description 
if(async_load[? "size"] > 0){
	var buff = async_load[? "buffer"];
	buffer_seek(buff, buffer_seek_start, 0);
	var msdID = buffer_read(buff, buffer_string);
	var response = json_decode(msdID);
	
	// -------------------------------------------------------------------- | DEBUG 
	if(ds_map_find_value(response, "type") == eNetworkMsgType.debug){
		var msg = ds_map_find_value(response, "message");
		show_debug_message("> " + string(msg));
	}
	
	//--------------------------------------------------------------------- | CREATE HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.create_host){
		var hostnumber = ds_map_find_value(response, "hostnumber");
		var playernumber = ds_map_find_value(response, "playernumber");
			
		global.NetworkHostNumber = hostnumber;
		global.NetworkPlayerNumber = playernumber;
		
		show_debug_message("Created host #" + string(hostnumber) + " with " + string(playernumber) + " players");
		room_goto(rmLobby);
	}
	
	//--------------------------------------------------------------------- | STOP HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.stop_host){
		var res = ds_map_find_value(response, "res");
		if(res == "stopped"){
			global.NetworkIsHostStop = true;
			global.Pause = false;
			room_goto(rmMain); 
		}
	}

	//--------------------------------------------------------------------- | GET HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.get_host){
		var hosts = ds_map_find_value(response, "hosts");
		number_of_hosts = ds_list_size(hosts);
		for (var i = 0; i < number_of_hosts; i++) {
		    var availableHost  = ds_list_find_value(hosts, i);
			number_of_players = ds_list_size(availableHost);
			recievedHosts = true;
		}
	}
	
	//--------------------------------------------------------------------- | JOIN HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.join_host){
		global.NetworkPlayerNumber = ds_map_find_value(response, "playerNumber");
		global.NetworkIsConnected = true;
		global.NetworkHostNumber = network_cursor;
		joinSucceed = true ;
		room_goto(rmLobby);
	}
	
	//--------------------------------------------------------------------- | LEAVE HOST
	if(ds_map_find_value(response, "type") == eNetworkMsgType.leave_host){
		show_debug_message("recived");
		leaveSucceed = true;
		global.NetworkIsConnected = false;
		room_goto(rmMain);
	}

}