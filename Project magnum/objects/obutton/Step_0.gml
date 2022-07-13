/// @description Insert

if(place_meeting(x, y, oCursor)){
	hover = true;
	if(mouse_check_button_released(mb_left)){
		clicked = true;
	}else{ clicked = false; } 
	
	if(mouse_check_button(mb_left)){
		held = true;	
	}else{ held = false}
	
}else{ hover = false; }


if(lookedAt){
	hover = true;	
}

