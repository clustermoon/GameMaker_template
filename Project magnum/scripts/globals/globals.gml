function declare_globals(){
	#region | 
		globalvar SaveFile;
		SaveFile = "savedgame.sav";
	#endregion
	
	#region | DELTA TIME
		globalvar TargetDelta, DeltaMultiplyer, DeltaReal;
			TargetDelta = 1/60; // USED FOR TIMERS
			DeltaReal = delta_time/1000000;
			DeltaMultiplyer = DeltaReal / TargetDelta; // USED FOR MOVEMENT AND ANIMATIONS
	#endregion
	
	#region | CONTROLLER INPUT
		globalvar GamePad;
			GamePad = noone;
	#endregion
	
	#region | GLOBAL FORCES
		globalvar Grav, Pause;
			Grav = 0.1;
			Pause = false;
	#endregion

	#region | GLOBALAL INPUTS
		globalvar Input_Move, Input_Action, InputType;
		InputType = "Keyboard";
		globalvar Input_Type_Keyboard, Input_Type_Controller;
		Input_Type_Keyboard[0] = vk_left; // lkey
		Input_Type_Keyboard[1] = vk_right; // rkey
		Input_Type_Keyboard[2] = vk_up; // ukey
		Input_Type_Keyboard[3] = vk_down; // dkey
		Input_Type_Keyboard[4] = vk_space; // akey
		Input_Type_Keyboard[5] = vk_shift; // bkey
		Input_Type_Keyboard[6] = ord("z"); // xkey
		Input_Type_Keyboard[7] = ord("x"); // ykey
		Input_Type_Keyboard[8] = ord("a"); // lbumper
		Input_Type_Keyboard[9] = ord("s"); // rbumper
	
		Input_Type_Controller[0] = gp_axislh; // lrkey
		Input_Type_Controller[1] = gp_axislv; // udkey
		Input_Type_Controller[2] = gp_axisrh; // lrkey
		Input_Type_Controller[3] = gp_axisrv; // udkey
		Input_Type_Controller[4] = gp_face1; // akey
		Input_Type_Controller[5] = gp_face2; // bkey
		Input_Type_Controller[6] = gp_face3; // xkey
		Input_Type_Controller[7] = gp_face4; // ykey
		Input_Type_Controller[8] = gp_shoulderl; // lbumper
		Input_Type_Controller[9] = gp_shoulderl; // rbumper
	#endregion

	#region | CAMERA 

	#endregion

}


