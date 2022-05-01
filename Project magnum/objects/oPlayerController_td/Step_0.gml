/// @description Controller
//Calling Input Array | Input_Move & Input_Action |
#region | updating variables
	var _h = Input_Move[0];
	var _v = Input_Move[1];
	var _fric = entity_fric*DeltaMultiplyer;
	var _mSpd = entity_maxSpd;
	var _moving = point_distance(0, 0, _h, _v) > 0.5;
#endregion

//Setting speed and direction
entity_spd = entity_tdControler_set_speed(entity_spd, _moving * _mSpd, _fric);
entity_dir = entity_tdControler_set_direction(_moving, _h, _v);




#region | Base Actions ~ Roll & Dash
/*
	var _b_button = Input_Action[2];
	var _b_button_held = Input_Action[3];
	var _l_bumper = Input_Action[8];
	var _r_bumper = Input_Action[10]; 
	maxSpd_dash = entity_maxSpd + entity_maxSpd*0.5;
	
	//Dash - B Button Held
	if(_b_button_held){ if(b_held >= 0){ b_held -= DeltaReal; }else{b_held = 0;}}else{ b_held = 0.5; }
	if(b_held <= 0){
		if(_b_button_held){
			_mSpd = maxSpd_dash;	
			reset_roll = true;
		}else{
			_mSpd = entity_maxSpd ;
			reset_roll = false;
		}
	}
	//Roll - B Button Pressed
	var _roll_cooldown = timer(roll_cooldown, reset_roll); // timer in between rolls
	if(roll_timer >= 0){ roll_timer -= DeltaReal; } // time a roll lasts
	if(_roll_cooldown <= 0){
		if(_moving && _b_button){
			roll = true;
		}
	}else{ reset_roll = false; }
		if(roll){
			roll_delay -= DeltaReal;
			if(roll_delay <= 0){
				entity_spd = roll_distance;
				reset_roll = true;
				roll_timer = iTime;
				if(roll_delay < -0.15){ roll = false; roll_delay = 0.1;}
			}
		}
		
		//if(roll_timer < 0){ if(_moving){ entity_dir = point_direction(0, 0, _h, _v); } }
		*/
#endregion



