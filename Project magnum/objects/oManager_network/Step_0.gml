/// @description Handshakes

#region | Handshake Stop Hosting
	if(global.NetworkShouldHostStop = true && global.NetworkIsHostStop = false){
		global.NetworkShouldHostStop = false;
		data = ds_map_create();
		ds_map_add(data, "hostNumber", global.NetworkHostNumber);
		ds_map_add(data, "res", noone);
	
		send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.stop_host);

		alarm[0] = 2*room_speed;
	}
#endregion

#region | Handshake Join lobby
	if(room == rmMain && oMenu_Main.page == 7){
		network_cursor = oMenu_Main.padCursor;	
		if(!recievedHosts && retrieveHosts){
			retrieveHosts = false;
			data = ds_map_create();
			ds_map_add(data, "hosts", noone);
			send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.get_host);
			alarm[1] = 3*room_speed;
		}
		
	}
#endregion

#region | Handshake Joining
	if(attemptJoin && !joinSucceed){
		attemptJoin = false;
		data = ds_map_create();
		ds_map_add(data, "hostNumber", network_cursor);
		ds_map_add(data, "playerNumber", noone);
		send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.join_host);
		alarm[2] = 2*room_speed;
	}
#endregion

#region | Handshake Leaving
	if(attemptLeave && !leaveSucceed){
		attemptLeave = false;
		data = ds_map_create();
		ds_map_add(data, "hostNumber", oManager_menu.network_cursor);
		ds_map_add(data, "playerNumber", noone);
		send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.leave_host);
		alarm[3] = 2*room_speed;
	}
#endregion



if(room == rmMain){ recievedHosts = false; }

