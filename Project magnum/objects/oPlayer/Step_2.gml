/// @description





#region | Networking Send Packet
	if(global.MultiplayerGame){
		var data = ds_map_create();
		ds_map_add(data, "id", id);
		ds_map_add(data, "x", x);
		ds_map_add(data, "y", y);
		send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.set_player_state);
	}
#endregion

