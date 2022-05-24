function input_check(input){
	if(input < 4) exit; // Cannot Be 0 - 3 for button checks. Those are Axis Only Values.
	switch(global.CurrentInputDevice){
		case eInputDevice.keyboard:
			return keyboard_check(global.Input[input]);
		break;
		case eInputDevice.controller:
			return gamepad_button_check(global.GamePad, global.Input[input]);
		break;
	}
}