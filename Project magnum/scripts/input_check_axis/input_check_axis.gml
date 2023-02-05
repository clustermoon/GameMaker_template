function input_check_axis(pad, input){
	if(input > 3) exit; // Cannot be above 3. Those are Button Only Values.
	
	if(global.MultiplayerGame){ // Online input
		switch(global.CurrentInputDevice){
			case eInputDevice.keyboard:
				return global.Input[input];
			break;
			case eInputDevice.controller:
				return gamepad_axis_value(global.GamePad, global.Input[input]);
			break;
		}
		
	}else{ // Local input
		
		if(pad == -4){
			return global.Input_keyboard[input];	
		}else{
			return gamepad_axis_value(pad, global.Input[input]);
		}
	}
}