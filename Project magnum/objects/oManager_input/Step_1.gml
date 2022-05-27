/// @description
if(!global.Freeze){
	#region | Switch Current device based on input
	if(global.NewInputSetting == false){
		if(keyboard_check(vk_anykey)){
			global.CurrentInputDevice = eInputDevice.keyboard;
	
		}else if( gamepad_button_check(global.GamePad, gp_start) || 
						gamepad_button_check(global.GamePad, gp_face1) ||
						gamepad_axis_value(global.GamePad, gp_axislh) != 0||
						gamepad_axis_value(global.GamePad, gp_axislv) != 0 ||
						gamepad_axis_value(global.GamePad, gp_axisrh) != 0 ||
						gamepad_axis_value(global.GamePad, gp_axisrv) != 0 ){ 
					  
			global.CurrentInputDevice = eInputDevice.controller; 
		}
	}
	#endregion

	#region | Catch inputs
	switch(global.CurrentInputDevice){
		case eInputDevice.keyboard:
			var _ord_l = keyboard_check(ord("A"));	var _arw_l = keyboard_check(vk_left);
			var _ord_r = keyboard_check(ord("D"));  var _arw_r = keyboard_check(vk_right);
			var _ord_d = keyboard_check(ord("S"));	var _arw_d = keyboard_check(vk_down);
			var _ord_u = keyboard_check(ord("W")); var _arw_u = keyboard_check(vk_up);
				
			global.Input[eInputState.lStick_hAxis]	= _ord_r - _ord_l;		 
			global.Input[eInputState.lStick_vAxis]	= _ord_d - _ord_u;
			global.Input[eInputState.rStick_hAxis]	= _arw_r - _arw_l;		 
			global.Input[eInputState.rStick_vAxis]	= _arw_d - _arw_u; 
		
			global.Input[eInputState.aButton]			= vk_space;	 
			global.Input[eInputState.bButton]			= vk_shift;
			global.Input[eInputState.xButton]			= ord("Z");	 
			global.Input[eInputState.yButton]			= ord("X");
																				
			global.Input[eInputState.rBumper]		= ord("1");
			global.Input[eInputState.rTrigger]			= ord("2");
			global.Input[eInputState.lBumper]		= ord("3");
			global.Input[eInputState.lTrigger]			= ord("4");
			global.Input[eInputState.start]				= vk_escape;
			global.Input[eInputState.select]				= ord("E");
			
			global.Input[eInputState.padl]				= ord("A");
			global.Input[eInputState.padr]				= ord("D");
			global.Input[eInputState.padu]				= ord("W");
			global.Input[eInputState.padd]				= ord("S");
			
		break;
		case eInputDevice.controller:
		
			global.Input[eInputState.lStick_hAxis]	=	gamepad_axis_value(global.GamePad, gp_axislh);
			global.Input[eInputState.lStick_vAxis]	=	gamepad_axis_value(global.GamePad, gp_axislv);
			global.Input[eInputState.rStick_hAxis]	=  gamepad_axis_value(global.GamePad, gp_axisrh);
			global.Input[eInputState.rStick_vAxis]	=	gamepad_axis_value(global.GamePad, gp_axisrv);

			global.Input[eInputState.aButton]			= gp_face1;	 
			global.Input[eInputState.bButton]			= gp_face2;
			global.Input[eInputState.xButton]			= gp_face3;	 
			global.Input[eInputState.yButton]			= gp_face4;
																				
			global.Input[eInputState.rBumper]		= gp_shoulderrb;
			global.Input[eInputState.rTrigger]			= gp_shoulderr;
			global.Input[eInputState.lBumper]		= gp_shoulderlb;
			global.Input[eInputState.lTrigger]			= gp_shoulderl;
			global.Input[eInputState.start]				= gp_start;
			global.Input[eInputState.select]				= gp_select;
			
			global.Input[eInputState.padl]				= gp_padl;
			global.Input[eInputState.padr]				= gp_padr;
			global.Input[eInputState.padu]				= gp_padu;
			global.Input[eInputState.padd]				= gp_padd;
			
		break;
	}
	#endregion
}

if(input_check_pressed(eInputState.start)){
	global.Pause = !global.Pause;	
}


