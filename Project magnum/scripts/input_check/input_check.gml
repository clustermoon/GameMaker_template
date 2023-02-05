function input_check(pad, input){
	if(input < 4) exit; // Cannot Be 0 - 3 for button checks. Those are Axis Only Values.
	
	if(global.MultiplayerGame){ // Online input
		switch(global.CurrentInputDevice){
			case eInputDevice.keyboard:
				return keyboard_check(global.Input[input]);
			break;
			case eInputDevice.controller:
				return gamepad_button_check(global.GamePad, global.Input[input]);
			break;
		}
	
	}else{
		if(pad == -4){
			//keyboard
			return keyboard_check(global.Input_keyboard[input]);	
		}else{
			//controller
			return gamepad_button_check(pad, global.Input_controller[input]);
		}
	}
}