if(room == rmMain){
#region | Main Menu
		var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
		var enter = input_check_pressed(eInputState.aButton) || keyboard_check_pressed(vk_enter);
		var lkey = input_check_pressed(eInputState.padl) || keyboard_check_pressed(vk_left);
		var rkey = input_check_pressed(eInputState.padr) || keyboard_check_pressed(vk_right);
		var ukey = input_check_pressed(eInputState.padu) || keyboard_check_pressed(vk_up);
		var dkey = input_check_pressed(eInputState.padd) || keyboard_check_pressed(vk_down);
		
		if(inputting){
			switch(ds_grid[# 1, menu_option[page]]){
				case menu_element_type.shift : 
					var hinput = rkey - lkey;
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, menu_option[page]] += hinput;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]] , 0, array_length(ds_grid[# 4, menu_option[page]])-1);
					} 
				break;
				case menu_element_type.slider : 
					switch(menu_option[page]){
						case 0: if(!audio_is_playing(sndTest_master)){ audio_play_sound(sndTest_master, 1, false); } break;	
						case 1: if(!audio_is_playing(sndTest_soundeffects)){ audio_play_sound(sndTest_soundeffects, 1, false); } break;	
						case 2: if(!audio_is_playing(sndTest_music)){ audio_play_sound(sndTest_music, 1, false); } break;	
					}
					
					var hinput = input_check_axis(eInputState.lStick_hAxis);
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, menu_option[page]] += hinput*0.01;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]] , 0, 1);
						script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
					} 
				break;
				case menu_element_type.toggle : 
					var hinput = rkey - lkey;
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, menu_option[page]] += hinput;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]] , 0, 1);
					} 
				break;
				case menu_element_type.input : 
				break;
			}
			
		}else{
			var y_pos = dkey - ukey;
			if(y_pos != 0){
				menu_option[page] += y_pos;
				if(menu_option[page] > ds_height-1){ menu_option[page] = 0; } 
				if(menu_option[page] < 0){ menu_option[page] = ds_height-1; } 
				//Play Audio Que
			}
		}
		
		if(enter){
			switch(ds_grid[# 1, menu_option[page]]){
				case menu_element_type.script_runner : script_execute(ds_grid[# 2, menu_option[page]]); break; 
				case menu_element_type.page_transfer : page = ds_grid[# 2, menu_option[page]]; break;
				case menu_element_type.shift : 
				case menu_element_type.slider : 
				case menu_element_type.toggle : if(inputting){script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);}
				case menu_element_type.input : 
					inputting = !inputting;
					break;
			}
			//Play Audio Que
		}
#endregion
}else {
#region | pause menu
	if(global.Pause){

		var ds_grid = pause_pages[page], ds_height = ds_grid_height(ds_grid);
		var enter = input_check_pressed(eInputState.aButton)  || keyboard_check_pressed(vk_enter);
		var lkey = input_check_pressed(eInputState.padl) || keyboard_check_pressed(vk_left);
		var rkey = input_check_pressed(eInputState.padr) || keyboard_check_pressed(vk_right);
		var ukey = input_check_pressed(eInputState.padu) || keyboard_check_pressed(vk_up);
		var dkey = input_check_pressed(eInputState.padd) || keyboard_check_pressed(vk_down);
		
		if(inputting){
			
			switch(ds_grid[# 1, pause_option[page]]){
				case menu_element_type.shift : 
					var hinput = rkey - lkey;
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, pause_option[page]] += hinput;
						ds_grid[# 3, pause_option[page]] = clamp(ds_grid[# 3, pause_option[page]] , 0, array_length(ds_grid[# 4, pause_option[page]])-1);
					} 
				break;
				case menu_element_type.slider : 
					switch(pause_option[page]){
						case 0: if(!audio_is_playing(sndTest_master)){ audio_play_sound(sndTest_master, 1, false); } break;	
						case 1: if(!audio_is_playing(sndTest_soundeffects)){ audio_play_sound(sndTest_soundeffects, 1, false); } break;	
						case 2: if(!audio_is_playing(sndTest_music)){ audio_play_sound(sndTest_music, 1, false); } break;	
					}
					
					var hinput = input_check_axis(eInputState.lStick_hAxis);
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, pause_option[page]] += hinput*0.01;
						ds_grid[# 3, pause_option[page]] = clamp(ds_grid[# 3, pause_option[page]] , 0, 1);
						script_execute(ds_grid[# 2, pause_option[page]], ds_grid[# 3, pause_option[page]]);
					} 
				break;
				case menu_element_type.toggle : 
					var hinput = rkey - lkey;
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, pause_option[page]] += hinput;
						ds_grid[# 3, pause_option[page]] = clamp(ds_grid[# 3, pause_option[page]] , 0, 1);
					} 
				break;
				case menu_element_type.input : 
				break;
			}
			
		}else{
			var y_pos = dkey - ukey;
			if(y_pos != 0){
				pause_option[page] += y_pos;
				if(pause_option[page] > ds_height-1){ pause_option[page] = 0; } 
				if(pause_option[page] < 0){ pause_option[page] = ds_height-1; } 
				//Play Audio Que
			}
		}
		
		if(enter){
			switch(ds_grid[# 1, pause_option[page]]){
				case menu_element_type.script_runner : script_execute(ds_grid[# 2, pause_option[page]]); break; 
				case menu_element_type.page_transfer : page = ds_grid[# 2, pause_option[page]]; break;
				case menu_element_type.shift : 
				case menu_element_type.slider : 
				case menu_element_type.toggle : if(inputting){script_execute(ds_grid[# 2, pause_option[page]], ds_grid[# 3, pause_option[page]]);}
				case menu_element_type.input : 
					inputting = !inputting;
					break;
			}
			//Play Audio Que
		}
	}
	
	#region | Networking
		if(room == rmJoinLobby){
			var ds_height = oManager_network.number_of_hosts;
			var enter = input_check_pressed(eInputState.aButton)  || keyboard_check_pressed(vk_enter);
			var lkey = input_check_pressed(eInputState.padl) || keyboard_check_pressed(vk_left);
			var rkey = input_check_pressed(eInputState.padr) || keyboard_check_pressed(vk_right);
			var ukey = input_check_pressed(eInputState.padu) || keyboard_check_pressed(vk_up);
			var dkey = input_check_pressed(eInputState.padd) || keyboard_check_pressed(vk_down);
		
			var y_pos = dkey - ukey;
			if(y_pos != 0){
				network_cursor += y_pos;
				if(network_cursor> ds_height-1){ network_cursor = 0; } 
				if(network_cursor < 0){ network_cursor = ds_height-1; } 
				//Play Audio Que
			}
			for(var k = 0; k < ds_height; k++){
				if(k == network_cursor){
					if(enter){ 
						global.NetworkIsConnected = true;
						oManager_network.attemptJoin = true;
					}
				}
			}
		}
	#endregion
#endregion
}
