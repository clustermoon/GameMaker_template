function input_check_axis(input){
	if(input > 3) exit; // Cannot be above 3. Those are Button Only Values.
	switch(global.CurrentInputDevice){
		case eInputDevice.keyboard:
			return global.Input[input];
		break;
		case eInputDevice.controller:
			return global.Input[input];
		break;
	}
}