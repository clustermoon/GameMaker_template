function change_input(){
	switch(global.CurrentInputDevice){
		case eInputDevice.keyboard:
			
			var keyCount = 0;
			for(var z = 0; z < array_length(global.InputList_keyboard); z++){
				if(global.InputList_keyboard[z] == keyboard_lastkey){
					keyCount++;
				}
			}
			
			show_debug_message(keyCount);
			
			if(keyCount == 0){
				global.InputList_keyboard[argument0] = keyboard_lastkey;
				show_debug_message(key_to_string(global.InputList_keyboard[argument0]) + " assigned to " + string(keyboard_lastkey));
			}
			
			/*For when you come back, you were trying to make it so
			that you cant assign a key thats already been assigned.*/
			
			
			inputting = false;
		break;
		case eInputDevice.controller:
			show_debug_message(global.InputList_controller[argument0]);
			global.InputList_controller[argument0] = gamepad_last;
			show_debug_message(keyboard_lastkey);
			inputting = false;
		break;
	}
}