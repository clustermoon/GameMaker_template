if(!global.Freeze){
	if(global.MultiplayerGame){		//| Multiplayer Game Controls - new controllers are read as different input devices available for use.
		#region | Switch Current device based on input
		if(global.NewInputSetting == false){
			if(keyboard_check(vk_anykey)){
				global.CurrentInputDevice = eInputDevice.keyboard;
	
			}else if( gamepad_button_check(global.GamePad, gp_start)           || 
							gamepad_button_check(global.GamePad, gp_face1)     ||
							gamepad_axis_value(global.GamePad, gp_axislh) != 0 ||
							gamepad_axis_value(global.GamePad, gp_axislv) != 0 ||
							gamepad_axis_value(global.GamePad, gp_axisrh) != 0 ||
							gamepad_axis_value(global.GamePad, gp_axisrv) != 0 ||
							gamepad_button_check(global.GamePad, gp_padu) != 0 || 
							gamepad_button_check(global.GamePad, gp_padl) != 0 || 
							gamepad_button_check(global.GamePad, gp_padr) != 0 || 
							gamepad_button_check(global.GamePad, gp_padd) != 0){ 
					  
				global.CurrentInputDevice = eInputDevice.controller; 
			}
		}
		#endregion

		#region | Catch inputs
		switch(global.CurrentInputDevice){
			case eInputDevice.keyboard:
				var _ord_l = keyboard_check(global.InputList_keyboard[eInputList.a]);	var _arw_l = keyboard_check(vk_left);
				var _ord_r = keyboard_check(global.InputList_keyboard[eInputList.d]);	var _arw_r = keyboard_check(vk_right);
				var _ord_d = keyboard_check(global.InputList_keyboard[eInputList.s]);	var _arw_d = keyboard_check(vk_down);
				var _ord_u = keyboard_check(global.InputList_keyboard[eInputList.w]);	var _arw_u = keyboard_check(vk_up);
				
				global.Input[eInputState.lStick_hAxis]		= _ord_r - _ord_l;		 
				global.Input[eInputState.lStick_vAxis]		= _ord_d - _ord_u;
				global.Input[eInputState.rStick_hAxis]		= _arw_r - _arw_l;		 
				global.Input[eInputState.rStick_vAxis]		= _arw_d - _arw_u; 
		
				global.Input[eInputState.aButton]			= global.InputList_keyboard[eInputList.aBtn];	 
				global.Input[eInputState.bButton]			= global.InputList_keyboard[eInputList.bBtn];
				global.Input[eInputState.xButton]			= global.InputList_keyboard[eInputList.xBtn]; 
				global.Input[eInputState.yButton]			= global.InputList_keyboard[eInputList.yBtn];
																				
				global.Input[eInputState.rBumper]			= global.InputList_keyboard[eInputList.rBmp];
				global.Input[eInputState.rTrigger]			= global.InputList_keyboard[eInputList.rTrg];
				global.Input[eInputState.lBumper]			= global.InputList_keyboard[eInputList.lBmp];
				global.Input[eInputState.lTrigger]			= global.InputList_keyboard[eInputList.lTrg];
				global.Input[eInputState.start]				= vk_escape;// <- bad
				global.Input[eInputState.select]			= global.InputList_keyboard[eInputList.select];
			
				global.Input[eInputState.padl]				= global.InputList_keyboard[eInputList.a];
				global.Input[eInputState.padr]				= global.InputList_keyboard[eInputList.d];
				global.Input[eInputState.padu]				= global.InputList_keyboard[eInputList.w];
				global.Input[eInputState.padd]				= global.InputList_keyboard[eInputList.s];
			
			break;
			case eInputDevice.controller:
		
				global.Input[eInputState.lStick_hAxis]		= gp_axislh;
				global.Input[eInputState.lStick_vAxis]		= gp_axislv;
				global.Input[eInputState.rStick_hAxis]		= gp_axisrh;
				global.Input[eInputState.rStick_vAxis]		= gp_axisrv;

				global.Input[eInputState.aButton]			= global.InputList_controller[eInputList.aBtn];	 
				global.Input[eInputState.bButton]			= global.InputList_controller[eInputList.bBtn];
				global.Input[eInputState.xButton]			= global.InputList_controller[eInputList.xBtn];	 
				global.Input[eInputState.yButton]			= global.InputList_controller[eInputList.yBtn];
																				
				global.Input[eInputState.rBumper]			= global.InputList_controller[eInputList.rBmp];
				global.Input[eInputState.rTrigger]			= global.InputList_controller[eInputList.rTrg];
				global.Input[eInputState.lBumper]			= global.InputList_controller[eInputList.lBmp];
				global.Input[eInputState.lTrigger]			= global.InputList_controller[eInputList.lTrg];
				global.Input[eInputState.start]				= gp_start;// <- bad
				global.Input[eInputState.select]			= global.InputList_controller[eInputList.select];
			
				global.Input[eInputState.padl]				= global.InputList_controller[eInputList.a];
				global.Input[eInputState.padr]				= global.InputList_controller[eInputList.d];
				global.Input[eInputState.padu]				= global.InputList_controller[eInputList.w];
				global.Input[eInputState.padd]				= global.InputList_controller[eInputList.s];
					
			
			break;
		}
		#endregion
	
	}else{							//| Local Game Controls - new controllers added are registerd as new players.
		var _ord_l = keyboard_check(global.InputList_keyboard[eInputList.a]);	var _arw_l = keyboard_check(vk_left);
		var _ord_r = keyboard_check(global.InputList_keyboard[eInputList.d]);	var _arw_r = keyboard_check(vk_right);
		var _ord_d = keyboard_check(global.InputList_keyboard[eInputList.s]);	var _arw_d = keyboard_check(vk_down);
		var _ord_u = keyboard_check(global.InputList_keyboard[eInputList.w]);	var _arw_u = keyboard_check(vk_up);
	
		global.Input_keyboard[eInputState.lStick_hAxis]		= _ord_r - _ord_l;		 
		global.Input_keyboard[eInputState.lStick_vAxis]		= _ord_d - _ord_u;
		global.Input_keyboard[eInputState.rStick_hAxis]		= _arw_r - _arw_l;		 
		global.Input_keyboard[eInputState.rStick_vAxis]		= _arw_d - _arw_u; 
	}
}

// Pause Game
/*
if(input_check_pressed(eInputState.start)){

	global.Pause = !global.Pause;	
}*/

// Create Cursor
if(global.GameCursor == noone){
	instance_destroy(oCursor);
	global.GameCursor = instance_create_depth(mouse_x, mouse_y, eInstanceDepth.close_3, oCursor);
} if(!instance_exists(oCursor)){ global.GameCursor = noone; }



