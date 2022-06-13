/// @description 
if(global.NetworkShouldHostStop = true && global.NetworkIsHostStop = false){
	global.NetworkShouldHostStop = false;
	stop_host();
	alarm[0] = 2*room_speed;
}

if(room == rmJoinLobby){
	if(!recievedHosts && retrieveHosts){
		retrieveHosts = false;
		var data = ds_map_create();
		ds_map_add(data, "hosts", noone);
		send_map_udp(global.NetworkIp, global.NetworkPort, 100, data, eNetworkMsgType.get_host)
		alarm[1] = 3*room_speed;
	}

}

if(room == rmMain){
	recievedHosts = false;	
}


