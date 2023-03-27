/// @description Main Game loops


#region | Initial player spawn
	if(global.MultiplayerGame){
		if(room == rmLobby){
			//Look for players
			if(startCheckingForPlayers && !checkForPlayers){ startCheckingForPlayers = false; alarm[0] = room_speed; }
			
			// Spawn Players into the lobby
			if(checkForPlayers){
				checkForPlayers = false;
				alarm[0] = (room_speed * 3)*global.DeltaMultiplyer;
				data = ds_map_create();
				ds_map_add(data, "hostNumber", global.NetworkHostNumber);
				ds_map_add(data, "players", noone);
				send_map_udp(global.NetworkIp, global.NetworkPort, 200, data, eNetworkMsgType.get_new_players);
			}
			
		}
	
	}else{
		
		
	}
#endregion

