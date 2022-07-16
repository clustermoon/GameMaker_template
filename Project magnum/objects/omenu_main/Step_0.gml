/// @description

// Variables
var ds_grid = menu_pages[page], ds_height = array_length(ds_grid);	// The data and its max height
var _x = menu_width/2;		// Positioning var ( menu_width/2 - string_width(_txt)/2 )
var _y = menu_height/2 - menu_height/14;		// Positioning var
draw_set_font(fntDebug);

#region | Left side
	//Create buttons
	for(var i = 0; i < ds_height; i++){
			
		var _info = ds_grid[i];//ds_grid[# 0, i]
		var _txt = _info[0];
	
		var _moptions = menu_options[page];
		_x = menu_width/2 - string_width(_txt)*0.25/2;

		var _yspc = i * 32;
		if(_moptions[i] == noone){
			if(page == eMenuMain_pages.input){
				_y = menu_height/2 - menu_height/3;	
			}
			_moptions[i] = instance_create_depth(_x, _y + _yspc, eInstanceDepth.close, oButton_text);
			var _btn = _moptions[i];
				
			_btn.txt = _txt;
			_btn.image_xscale = string_width(_txt)*_btn.scl/2;
			_btn.image_yscale = string_height(_txt)*_btn.scl/2;
		
		}else{ break; }
	}



	#region | Virtual Cursor
		var _dkey = input_check_pressed(eInputState.padd) || keyboard_check(vk_down);
		var _ukey = input_check_pressed(eInputState.padu) || keyboard_check(vk_up);
		var _lkey = input_check_pressed(eInputState.padl) || keyboard_check(vk_left);
		var _rkey = input_check_pressed(eInputState.padr) || keyboard_check(vk_right);

		virtualCursorVert_max = ds_height;
		
		if(!inputting){
		#region | Moving
		
			//Down
			if((virtualCursor[0] < virtualCursorVert_max-1) && _dkey){
				virtualCursor[0] += 1;
			}else if(virtualCursor[0] > virtualCursorVert_max-1){ virtualCursor[0] = 0; }

			//Up
			if((virtualCursor[0] > 0) && _ukey){
				virtualCursor[0] -= 1;
			}else if(virtualCursor[0] < 0){ virtualCursor[0] = virtualCursorVert_max-1; }

			//Right
			if((virtualCursor[1] < virtualCursorHorz_max) && _rkey){
				virtualCursor[1] += 1;
			}else if(virtualCursor[1] > virtualCursorHorz_max){ virtualCursor[1] = 0; }

			//Left
			if((virtualCursor[1] > 0) && _lkey){
				virtualCursor[1] -= 1;
			}else if(virtualCursor[1] < 0){ virtualCursor[1] = virtualCursorHorz_max; }
		#endregion
		}
	
		//moving cursor and using it
		var _cursorOnButtons = false;
		var _enter;
		if(prevPage == page){
			_enter = (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) || input_check_pressed(eInputState.aButton);
		}
	
		with(oCursor){
			if(place_meeting(x,y, oButton)){
				_cursorOnButtons = true;	
			}
		}
	
		//Interact with stuff 
		if(_cursorOnButtons == false){
			for(var l = 0; l < virtualCursorVert_max; l++){	
				var page_option = menu_options[page];
				if(page_option[l] != noone){
					if(virtualCursor[0] == l){
						if(instance_exists(page_option[l])){ 
							page_option[l].lookedAt = true;  
							if(page == eMenuMain_pages.input){
								if(keyboard_check_pressed(vk_anykey) && inputting){
									page_option[l].clicked = !page_option[l].clicked;	
								}
								if(_enter && l != array_length(page_option)-1){
									inputting = true;	
								}else if(_enter && l == array_length(page_option)-1){ page_option[l].clicked = !page_option[l].clicked; }
							}else if(page == eMenuMain_pages.sound || page == eMenuMain_pages.graphics){
								if(_enter && l != array_length(page_option)-1){
									inputting = !inputting;	
								}else if(_enter && l == array_length(page_option)-1){ page_option[l].clicked = !page_option[l].clicked; }
							}else{
								if(_enter){ page_option[l].clicked = !page_option[l].clicked; }
							}
						}
					}
				}
			}
		}
		


	#endregion

	//Clicking Buttons
	for(var j = 0; j < array_length(menu_options[page]); j++){
		var _button = menu_options[page];
		if(_button[j] != noone && instance_exists(_button[j])){ 
			if(_button[j].clicked == true){
				if( j < ds_height){
					var _info = ds_grid[j];
				}
				show_debug_message(string(_info[0]) + " button was clicked!");
				if(_info[1] != -1){ 
					if(_info[2] != -1){
						script_execute(_info[1], _info[2]);
					}else{
						script_execute(_info[1]); 
					}
				}
				
				_button[j].clicked = false;
			}
		}
	}


	if(prevPage != page){ prevPage = page }
#endregion

if(inputting && (page == eMenuMain_pages.graphics || page == eMenuMain_pages.sound)){
	switch(page){
		case eMenuMain_pages.graphics:
			
		break;
		case eMenuMain_pages.sound:
			if(virtualCursor[0] == 0){
				if(oManager_sound.gain_master >= 0 && oManager_sound.gain_master <= 1){
					oManager_sound.gain_master += 0.01*input_check_axis(eInputState.lStick_hAxis);
					if(scroll_bars[0] != noone){
						if(instance_exists(scroll_bars[0])){
							scroll_bars[0].xx += 1*input_check_axis(eInputState.lStick_hAxis);
							if(scroll_bars[0].xx < scroll_bars[0].x - scroll_bars[0].size/2 ){ scroll_bars[0].xx = scroll_bars[0].x - scroll_bars[0].size/2; } 
							if(scroll_bars[0].xx > scroll_bars[0].x + scroll_bars[0].size/2){ scroll_bars[0].xx = scroll_bars[0].x + scroll_bars[0].size/2; }
							if(input_check_axis(eInputState.lStick_hAxis) != 0 ){ audio_play_sound(sndTest_master, 5, false); }
						}
					}
				}else if(oManager_sound.gain_master < 0){ oManager_sound.gain_master = 0; } else if(oManager_sound.gain_master > 1){ oManager_sound.gain_master = 1; }
				
			}	
			if(virtualCursor[0] == 1){
				if(oManager_sound.gain_music >= 0 && oManager_sound.gain_music <= 1){
					oManager_sound.gain_music += 0.01*input_check_axis(eInputState.lStick_hAxis);
					if(scroll_bars[1] != noone){
						if(instance_exists(scroll_bars[1])){
							scroll_bars[1].xx += 1*input_check_axis(eInputState.lStick_hAxis);
							if(scroll_bars[1].xx < scroll_bars[1].x - scroll_bars[1].size/2 ){ scroll_bars[1].xx = scroll_bars[1].x - scroll_bars[1].size/2; } 
							if(scroll_bars[1].xx > scroll_bars[1].x + scroll_bars[1].size/2){ scroll_bars[1].xx = scroll_bars[1].x + scroll_bars[1].size/2; }
							if(input_check_axis(eInputState.lStick_hAxis) != 0 ){ audio_play_sound(sndTest_music, 5, false); }							
						}
					}
				}else if(oManager_sound.gain_music < 0){ oManager_sound.gain_music = 0; } else if(oManager_sound.gain_music > 1){ oManager_sound.gain_music = 1; }
			}	
			if(virtualCursor[0] == 2){
				if(oManager_sound.gain_effects >= 0 && oManager_sound.gain_effects <= 1){
					oManager_sound.gain_effects += 0.01*input_check_axis(eInputState.lStick_hAxis);
					if(scroll_bars[2] != noone){
						if(instance_exists(scroll_bars[0])){
							scroll_bars[2].xx += 1*input_check_axis(eInputState.lStick_hAxis);
							if(scroll_bars[2].xx < scroll_bars[2].x - scroll_bars[2].size/2 ){ scroll_bars[2].xx = scroll_bars[2].x - scroll_bars[2].size/2; } 
							if(scroll_bars[2].xx > scroll_bars[2].x + scroll_bars[2].size/2){ scroll_bars[2].xx = scroll_bars[2].x + scroll_bars[2].size/2; }
							if(input_check_axis(eInputState.lStick_hAxis) != 0 ){ audio_play_sound(sndTest_soundeffects, 5, false); }
						}
					}
				}else if(oManager_sound.gain_effects < 0){ oManager_sound.gain_effects = 0; } else if(oManager_sound.gain_effects > 1){ oManager_sound.gain_effects = 1; }
			}	
		break;
	}
}



