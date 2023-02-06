/// @description Insert description here
//Control pad cursor - Used to navigate the menu using the keyboard and gamepad
if(!preventCursor){
	var _ml = array_length(menu_pages[page])-1;
	if(input_check_pressed(global.GamePad, eInputState.padd) || gamepad_axis_value(global.GamePad, gp_axislv) > 0){
		if(padCursor < _ml){
			padCursor++;
		}else{ padCursor = 0; }
	}else if(input_check_pressed(global.GamePad, eInputState.padu) || gamepad_axis_value(global.GamePad, gp_axislv) < 0){
		if(padCursor > 0){
			padCursor--;
		}else{ padCursor = _ml; }
	}
}
	
// add hosts to the list
if(page == 7){
	var ds_height = oManager_network.number_of_hosts;
		
	if(ds_height > array_length(menu_pages[7])){
		menu_pages[7] = [];
		for(var k = 0; k < ds_height; k++){
			array_insert(menu_pages[7], 0, [string("HOST: ") + string(k),	eMenu_element_type.script_runner, menuJoinMenu_joinLobby, noone]);
		}
		
		array_insert(menu_pages[7], ds_height, ["BACK", eMenu_element_type.script_runner, menuJoinMenu_back, noone]);
	}
}else{
	menu_pages[7] = [];	
}

	
//create buttons
for(var i = 0; i < array_length(menu_pages[page]); i++){
	var _str = menu_pages[page][i, 0];
	var _inst = menu_pages[page][i, 3];
	var _len = array_length(menu_pages[page])-1;
	var _type = oButton_text;
	if(	_inst = noone){
		var _spacing = 64*i;				// The vertical spacing between buttons
		if(page == 2){  _spacing = 32*i; }  // The vertical spacing in the input menu
		if(page == 4 ){ if(i == _len){ _type = oButton_text; }else{ _type = oScrollBar;} }
			
		// Creating Buttons
		menu_pages[page][i, 3] = instance_create_depth(menu_width/2, (menu_height/2 - 86) + _spacing, depth, _type);
		menu_pages[page][i, 3].txt = _str;						// Put text for the button to draw
		menu_pages[page][i, 3].alph = 0.5;						// The alpha for the text
		menu_pages[page][i, 3].scl = 0.4;						// The scale for the text
		menu_pages[page][i, 3].scr = menu_pages[page][i, 2];	// The Script to run when clicked
			
		// Input menu specific interactions
		if(page == 2 && (_str != "BACK" && _str != "RESET TO DEFAULT")){	// Do this for everything expect to back button
			menu_pages[page][i, 3].delayInput = true;						// Set delay mode to true (Delay mode is basically only used for the input menu)
			menu_pages[page][i, 3].arg = i;									// The argument to input into the script being run on click
		}
			
		if(page == 4){
			if(array_length(menu_pages[page][i])-1 > 3){
				menu_pages[page][i, 3].arg = menu_pages[page][i, 4];	
			}
		}
			
	}

		
	//Interact with buttons
	menu_pages[page][i, 3].lookedAt = false;					// Reset values
	menu_pages[page][i, 3].clicked = false;						// Reset values
	if(global.CurrentInputDevice == eInputDevice.controller){
		if(i == padCursor){										// if cursor is on button
			menu_pages[page][i, 3].lookedAt = true;				// Make button change color
			menu_pages[page][i, 3].clicked = _pressedStart; 	// Click button with interact
				
		}
	}
		
	if (global.CurrentInputDevice == eInputDevice.keyboard){
		if(menu_pages[page][i, 3].hover){
			padCursor = i;	
		}
	}
		
		
}