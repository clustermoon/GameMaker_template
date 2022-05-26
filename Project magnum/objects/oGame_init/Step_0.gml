//Timer
wait_time -= global.DeltaReal;

//Transition
if(wait_time < 0){
	//Play Sound
	if(!instance_exists(oManager_camera)){ instance_create_depth(x, y, depth, oManager_camera); }
	room_goto(rmMain);
}


