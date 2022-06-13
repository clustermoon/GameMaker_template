// This is a badly named function and is not to be used as an alternative for 'rm_goto'
function room_goto_menu(){
	if(!global.MultiplayerGame){
		room_goto(rmMain);
	}else{
		if(room == rmLobby){
			global.NetworkShouldHostStop = true;
		}
		if (room == rmJoinLobby){
			room_goto(rmMain);
		}
	}
}