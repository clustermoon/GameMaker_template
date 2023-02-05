/// @description Insert description here
if(active && !inputting){
	if(place_meeting(x, y, oCursor)){
		hover = true;
		clicked = mouse_check_button_released(mb_left);
	
		if(mouse_check_button(mb_left)){
			held = true;	
		}else{ held = false}
	
	}else{ hover = false; }


	if(lookedAt){
		hover = true;	
	}
} 
	
if(clicked && !mouse_check_button_released(mb_left)){
	inputting = !inputting; 
		
}else if(mouse_check_button_released(mb_left)){
		
	audio_play_sound(testSnd, 1, 0);	

		percent = ((xx+size/2)-x)/100;
		script_execute(scr, arg, percent);	// Run script with optional argument

}
	
if(inputting){
	if(!place_meeting(x, y, oCursor)){
		var _xInput = input_check_pressed(global.GamePad, eInputState.padr) - input_check_pressed(global.GamePad, eInputState.padl);
		var _xInput_ax = input_check_axis(global.GamePad, eInputState.lStick_hAxis);
		if((_xInput > 0 || _xInput_ax > 0) && xx < x+size/2 ){ xx++; }
		if((_xInput < 0 || _xInput_ax < 0) && xx > x-size/2 ){ xx--; }	
		if((_xInput != 0 || _xInput_ax != 0)){ audio_play_sound(testSnd, 1, 0);}
			
		if(input_check_pressed(global.GamePad, eInputState.padd) || input_check_pressed(global.GamePad, eInputState.padu) || input_check_axis(global.GamePad, eInputState.lStick_vAxis) != 0){
			inputting = !inputting; 
		}	
			
		if(arg != noone){
			percent = ((xx+size/2)-x)/100;
			script_execute(scr, arg, percent);	// Run script with optional argument
		}else{
			script_execute(scr);	// Run script normally
		}
			
	}
}
	





