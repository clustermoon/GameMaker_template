/// @description Insert

if(delayInput){
	// Delayed inputting allows first click to be read normally
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

	// Afterwards it Allows for additional ways to click when in delayed inputting
	if(active && inputting){ 
		if(!mouse_check_button_pressed(mb_any) && 
			keyboard_check_pressed(vk_anykey) ||
			gamepad_button_check_pressed(global.GamePad, gp_face1) ||
			gamepad_button_check_pressed(global.GamePad, gp_face2) ||
			gamepad_button_check_pressed(global.GamePad, gp_face3) ||
			gamepad_button_check_pressed(global.GamePad, gp_face4) ||
			gamepad_button_check_pressed(global.GamePad, gp_padd) ||
			gamepad_button_check_pressed(global.GamePad, gp_padl) ||
			gamepad_button_check_pressed(global.GamePad, gp_padu) ||
			gamepad_button_check_pressed(global.GamePad, gp_padr) ||
			gamepad_button_check_pressed(global.GamePad, gp_shoulderl ) ||
			gamepad_button_check_pressed(global.GamePad, gp_shoulderr ) ||
			gamepad_button_check_pressed(global.GamePad, gp_shoulderlb) ||
			gamepad_button_check_pressed(global.GamePad, gp_shoulderrb) 
		){
			clicked = true;	input = true;
		}
	
	}
	
	// Once clicked the menu cursor gets disabled
	if(clicked){ 
		if(inputting == false){ oMenu_Main.preventCursor = true; }
		inputting = !inputting; // A flag gets triggered
	}

	// When we have 'clicked' while being delayed we run the on click script
	if(clicked && input && scr != noone){
		if(arg != noone){
			script_execute(scr, arg);	// Run script with optional argument
		}else{
			script_execute(scr);	// Run script normally
		}
		input = false; oMenu_Main.preventCursor = false; // Reset menu cursor's prevention
	}

}else{
	// Base button text 
	if(active){
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

	if(scr != noone && clicked){
		if(arg != noone){
			script_execute(scr, arg);
		}else{
			script_execute(scr);
		}
	}
}


if(follow_id != noone){
	x = follow_id.x;	
	y = follow_id.y;	
}


image_xscale = (string_width(txt)/2)*scl;
image_yscale = (string_height(txt)/2)*scl;

