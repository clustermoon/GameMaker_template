//Timer
wait_time -= global.DeltaReal;

//Transition
if(wait_time < 0){
	//Play Sound
	instance_create_depth(x, y, depth, oCamera);
	room_goto(rmMain);
}


