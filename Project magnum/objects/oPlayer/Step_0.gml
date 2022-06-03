/// @description 
if(!is_local) exit;

#region | Main Update loop
	if(!global.Pause){
		if(!is_dead){	
			
			#region | Move Player
				var hor = input_check_axis(eInputState.lStick_hAxis);
				var ver = input_check_axis(eInputState.lStick_vAxis);
			
				var _mspd = 3 * global.DeltaMultiplyer;
			
				x += hor * _mspd;
				y += ver * _mspd;
		
			#endregion

		}else{
			// Dead
		}
	}
#endregion


		
		


