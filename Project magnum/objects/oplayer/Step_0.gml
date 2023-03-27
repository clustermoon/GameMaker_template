/// @description 
if(localPlayer){
	hKey = input_check_axis(global.GamePad, eInputState.lStick_hAxis);
	vKey = input_check_axis(global.GamePad, eInputState.lStick_vAxis);
	
	//send data
	data = ds_map_create();
	ds_map_add(data, "hKey", hKey);
	ds_map_add(data, "vKey", vKey);
	ds_map_add(data, "x", x);
	ds_map_add(data, "y", y);
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	ds_map_add(data, "playerNumber", global.NetworkPlayerNumber);
	send_map_udp(global.NetworkIp, global.NetworkPort, 1000, data, eNetworkMsgType.set_player_state);
	
	playerNumber = global.NetworkPlayerNumber;
	
}else{
	
	//recieve data
	data = ds_map_create();
	ds_map_add(data, "hostNumber", global.NetworkHostNumber);
	ds_map_add(data, "playerNumber", playerNumber);
	ds_map_add(data, "playerStates", noone);
	send_map_udp(global.NetworkIp, global.NetworkPort, 300, data, eNetworkMsgType.get_player_state);
}

//move player

hspd += (hKey*0.04)*global.DeltaMultiplyer;
vspd += (vKey*0.04)*global.DeltaMultiplyer;

show_debug_message(hKey);
