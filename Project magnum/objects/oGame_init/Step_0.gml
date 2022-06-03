//Timer
wait_time -= global.DeltaReal;

//Transition
if(wait_time < 0){
	//Play Sound
	if(!instance_exists(oManager_camera)){ instance_create_depth(x, y, depth, oManager_camera); }
	
	#region | Networking
		if(global.MultiplayerGame){
			if(!instance_exists(oManager_network)){ instance_create_depth(x, y, depth, oManager_network); }
		}
	#endregion
	
	
	room_goto(rmMain);
}

zoom = display_get_width()/480;

