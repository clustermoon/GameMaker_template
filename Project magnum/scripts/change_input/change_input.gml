function change_input(){
	switch(global.CurrentInputDevice){
		
		case eInputDevice.keyboard:
			show_debug_message(keyboard_lastkey);
			global.InputList_keyboard[argument0] = keyboard_lastkey;

			
			/*For when you come back, you were trying to make it so
			that you cant assign a key thats already been assigned.*/
			
		break;
		case eInputDevice.controller:
		    var gamepad_last = 0;
			if(	gamepad_button_check_pressed(global.GamePad, gp_face1)		 ){ gamepad_last =  gp_face1; }
			if( gamepad_button_check_pressed(global.GamePad, gp_face2)		 ){ gamepad_last =  gp_face2; }
			if( gamepad_button_check_pressed(global.GamePad, gp_face3)		 ){ gamepad_last =  gp_face3; }
			if( gamepad_button_check_pressed(global.GamePad, gp_face4)		 ){ gamepad_last =  gp_face4; }
			if( gamepad_button_check_pressed(global.GamePad, gp_padd)		 ){ gamepad_last =  gp_padd ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_padl)		 ){ gamepad_last =  gp_padl ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_padu)		 ){ gamepad_last =  gp_padu ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_padr)		 ){ gamepad_last =  gp_padr ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_shoulderl )  ){ gamepad_last =  gp_shoulderl ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_shoulderr )  ){ gamepad_last =  gp_shoulderr ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_shoulderlb)  ){ gamepad_last =  gp_shoulderlb ; }
			if( gamepad_button_check_pressed(global.GamePad, gp_shoulderrb)  ){ gamepad_last =  gp_shoulderrb ; }
			
				
			
			
			if(gamepad_last != 0){
				var _bool = true;
				var _conflict = noone;
				for(var i = 0; i < array_length(global.InputList_controller); i++){
					if(global.InputList_controller[i] == gamepad_last){
						_bool = false;
						_conflict = i;
					}
				}
					show_debug_message(_bool);
					if(_bool){ 
						global.InputList_controller[argument0] = gamepad_last; 
					}else{
						global.InputList_controller[argument0] = gamepad_last; 
						global.InputList_controller[_conflict] = 80000;
						
					}
			}


		break;
		
	}
}