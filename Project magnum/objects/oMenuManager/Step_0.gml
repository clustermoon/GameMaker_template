if(room == rmMenu){
		var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
		var enter = Input_Action[0] || keyboard_check_pressed(vk_enter);
		
		if(inputting){
			
			switch(ds_grid[# 1, menu_option[page]]){
				case menu_element_type.shift : 
					var hinput = Input_Move[2] - Input_Move[3];
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
					
					var hinput = Input_Move[0];
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, menu_option[page]] += hinput*0.01;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]] , 0, 1);
						script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
					} 
				break;
				case menu_element_type.toggle : 
					var hinput = Input_Move[2] - Input_Move[3];
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
			var y_pos = Input_Move[5] - Input_Move[4];
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

}else{

	if(!Pause) exit;

		var ds_grid = pause_pages[page], ds_height = ds_grid_height(ds_grid);
		var enter = Input_Action[0] || keyboard_check_pressed(vk_enter);
		
		if(inputting){
			
			switch(ds_grid[# 1, pause_option[page]]){
				case menu_element_type.shift : 
					var hinput = Input_Move[2] - Input_Move[3];
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
					
					var hinput = Input_Move[0];
					if(hinput != 0){
						//Audio que
						ds_grid[# 3, pause_option[page]] += hinput*0.01;
						ds_grid[# 3, pause_option[page]] = clamp(ds_grid[# 3, pause_option[page]] , 0, 1);
						script_execute(ds_grid[# 2, pause_option[page]], ds_grid[# 3, pause_option[page]]);
					} 
				break;
				case menu_element_type.toggle : 
					var hinput = Input_Move[2] - Input_Move[3];
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
			var y_pos = Input_Move[5] - Input_Move[4];
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
