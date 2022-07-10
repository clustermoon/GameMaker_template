// This is a badly named function and is not to be used as an alternative for 'rm_goto'
function room_goto_menu(){
	if(!global.MultiplayerGame){
		room_goto(rmMain);
	}else{
		if(room == rmLobby){
			if(global.NetworkIsHost){
				global.NetworkShouldHostStop = true;
				global.NetworkIsHost = false;
			}else{
				oManager_network.attemptLeave = true;	
			}
		}
		if (room == rmJoinLobby){
			room_goto(rmMain);
		}
	}
	global.Pause = false;
}