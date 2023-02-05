/// @description 
connectedControllers = [];

//Cursor
global.GameCursor = noone;
window_set_cursor(cr_none);

enum eInputList {
	a,
	d,
	s,
	w,
	aBtn,
	bBtn,
	xBtn,
	yBtn,
	rBmp,
	rTrg,
	lBmp,
	lTrg,
	select	
}

#region | keyboard
	global.InputList_keyboard = [
		vk_left,//ord("A"),
		vk_right, //ord("D"),
		vk_down, //ord("S"),
		vk_up,//ord("W"),
		vk_space,
		vk_shift,
		ord("Z"),
		ord("X"),
		ord("1"),
		ord("2"),
		ord("3"),
		ord("4"),
		ord("E")
	];
	
	global.Input_keyboard[eInputState.lStick_hAxis]		= 0;	 
	global.Input_keyboard[eInputState.lStick_vAxis]		= 0;
	global.Input_keyboard[eInputState.rStick_hAxis]		= 0;	 
	global.Input_keyboard[eInputState.rStick_vAxis]		= 0;
				
	global.Input_keyboard[eInputState.aButton]			= global.InputList_keyboard[eInputList.aBtn];	 
	global.Input_keyboard[eInputState.bButton]			= global.InputList_keyboard[eInputList.bBtn];
	global.Input_keyboard[eInputState.xButton]			= global.InputList_keyboard[eInputList.xBtn]; 
	global.Input_keyboard[eInputState.yButton]			= global.InputList_keyboard[eInputList.yBtn];
																	
	global.Input_keyboard[eInputState.rBumper]			= global.InputList_keyboard[eInputList.rBmp];
	global.Input_keyboard[eInputState.rTrigger]			= global.InputList_keyboard[eInputList.rTrg];
	global.Input_keyboard[eInputState.lBumper]			= global.InputList_keyboard[eInputList.lBmp];
	global.Input_keyboard[eInputState.lTrigger]			= global.InputList_keyboard[eInputList.lTrg];
	global.Input_keyboard[eInputState.start]				= vk_escape;
	global.Input_keyboard[eInputState.select]			= global.InputList_keyboard[eInputList.select];
				
	global.Input_keyboard[eInputState.padl]				= global.InputList_keyboard[eInputList.a];
	global.Input_keyboard[eInputState.padr]				= global.InputList_keyboard[eInputList.d];
	global.Input_keyboard[eInputState.padu]				= global.InputList_keyboard[eInputList.w];
	global.Input_keyboard[eInputState.padd]				= global.InputList_keyboard[eInputList.s];
			

#endregion

#region | controller

	global.InputList_controller = [
		gp_padl,
		gp_padr,
		gp_padd,
		gp_padu,
		gp_face1,
		gp_face2,
		gp_face3,
		gp_face4,
		gp_shoulderrb,
		gp_shoulderr,
		gp_shoulderlb,
		gp_shoulderl,
		gp_select
	];

	global.Input_controller[eInputState.lStick_hAxis]		= gp_axislh;
	global.Input_controller[eInputState.lStick_vAxis]		= gp_axislv;
	global.Input_controller[eInputState.rStick_hAxis]		= gp_axisrh;
	global.Input_controller[eInputState.rStick_vAxis]		= gp_axisrv;
	   
	global.Input_controller[eInputState.aButton]			= global.InputList_controller[eInputList.aBtn];	 
	global.Input_controller[eInputState.bButton]			= global.InputList_controller[eInputList.bBtn];
	global.Input_controller[eInputState.xButton]			= global.InputList_controller[eInputList.xBtn];	 
	global.Input_controller[eInputState.yButton]			= global.InputList_controller[eInputList.yBtn];
																		
	global.Input_controller[eInputState.rBumper]			= global.InputList_controller[eInputList.rBmp];
	global.Input_controller[eInputState.rTrigger]			= global.InputList_controller[eInputList.rTrg];
	global.Input_controller[eInputState.lBumper]			= global.InputList_controller[eInputList.lBmp];
	global.Input_controller[eInputState.lTrigger]			= global.InputList_controller[eInputList.lTrg];
	global.Input_controller[eInputState.start]				= gp_start;
	global.Input_controller[eInputState.select]				= global.InputList_controller[eInputList.select];
		
	global.Input_controller[eInputState.padl]				= global.InputList_controller[eInputList.a];
	global.Input_controller[eInputState.padr]				= global.InputList_controller[eInputList.d];
	global.Input_controller[eInputState.padu]				= global.InputList_controller[eInputList.w];
	global.Input_controller[eInputState.padd]				= global.InputList_controller[eInputList.s];

#endregion


