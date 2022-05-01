

//Timer
d = delta_time/1000000;
wait_time -= d;

//Transition
if(wait_time < 0){
	//Play Sound
	room_goto_menu();
}


