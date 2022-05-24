function input_check_released(input){
	if(input < 4) exit; // Cannot Be 0 - 3 for button checks. Those are Axis Only Values.	
	switch(global.CurrentInputDevice){
		case eInputDevice.keyboard:
			return keyboard_check_released(global.Input[input]);
		break;
		case eInputDevice.controller:
			return gamepad_button_check_released(global.GamePad, global.Input[input]);
		break;
	}
}