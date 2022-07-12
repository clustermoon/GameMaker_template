/// @description
switch(page){
	case eMenuMain_pages.main:
		#region | Main Menu
			#region | Creating Buttons
				if(button_MainStart == noone){
					var _button_txt = "START";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 - 32;

					button_MainStart = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_MainStart.txt = _button_txt;
					button_MainStart.image_xscale = string_width(_button_txt)/2;
					button_MainStart.image_yscale = string_height(_button_txt)/2;
				}
				if(button_MainSettings == noone){
					_button_txt = "Settings";
					_x = menu_width/2; // - string_width(_button_txt)/2;
					_y = menu_height/2;
					button_MainSettings = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_MainSettings.txt = _button_txt;
					button_MainSettings.image_xscale = string_width(_button_txt)/2;
					button_MainSettings.image_yscale = string_height(_button_txt)/2;
				}
				if(button_MainExit == noone){
					_button_txt = "Exit";
					_x = menu_width/2; // - string_width(_button_txt)/2;
					_y = menu_height/2 + 32;
					button_MainExit = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_MainExit.txt = _button_txt;
					button_MainExit.image_xscale = string_width(_button_txt)/2;
					button_MainExit.image_yscale = string_height(_button_txt)/2;
				}
		
			#endregion

			#region | Clicking Buttons
				//Start Button
				if(button_MainStart != noone){
					if(button_MainStart.clicked){
						show_debug_message("Start button clicked");
						room_goto(rmTestGrounds);
					}
				}
				//Settings Button
				if(button_MainSettings != noone){
					if(button_MainSettings.clicked){
						show_debug_message("Settings Page clicked");	
						page = eMenuMain_pages.settings;
						instance_destroy(button_MainStart);
						button_MainStart	= noone;
						instance_destroy(button_MainSettings);
						button_MainSettings = noone;
						instance_destroy(button_MainExit);
						button_MainExit		= noone;
					}
				}
				//Exit Button
				if(button_MainExit != noone){
					if(button_MainExit.clicked){
						show_debug_message("Exit button clicked");
						game_end();
					}
				}
			#endregion
		

	#endregion
	break;
	case eMenuMain_pages.settings:
		#region | Settings Menu
		
			#region | Creating Buttons 
				if(button_SetGraphics == noone){
					var _button_txt = "Graphics";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 - 32;
					button_SetGraphics = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_SetGraphics.txt = _button_txt;
					button_SetGraphics.image_xscale = string_width(_button_txt)/2;
					button_SetGraphics.image_yscale = string_height(_button_txt)/2;
				}
				if(button_SetSound == noone){
					var _button_txt = "Sound";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2;
					button_SetSound = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_SetSound.txt = _button_txt;
					button_SetSound.image_xscale = string_width(_button_txt)/2;
					button_SetSound.image_yscale = string_height(_button_txt)/2;
				}
				if(button_SetInput == noone){
					var _button_txt = "Input";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 + 32;
					button_SetInput = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_SetInput.txt = _button_txt;
					button_SetInput.image_xscale = string_width(_button_txt)/2;
					button_SetInput.image_yscale = string_height(_button_txt)/2;
				}
				if(button_SetBack == noone){
					var _button_txt = "Back";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 + 64;
					button_SetBack = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_SetBack.txt = _button_txt;
					button_SetBack.image_xscale = string_width(_button_txt)/2;
					button_SetBack.image_yscale = string_height(_button_txt)/2;
				}
			#endregion
			
			#region | Clicking buttons
				//graphics Button
				if(button_SetGraphics != noone){
					if(button_SetGraphics.clicked){
						show_debug_message("Graphics Page clicked");
						page = eMenuMain_pages.graphics;
						instance_destroy(button_SetGraphics);
						button_SetGraphics	= noone;
						instance_destroy(button_SetSound);
						button_SetSound = noone;
						instance_destroy(button_SetInput);
						button_SetInput = noone;
						instance_destroy(button_SetBack);
						button_SetBack	= noone;
					}
				}
				//Sound Button
				if(button_SetSound != noone){
					if(button_SetSound.clicked){
						show_debug_message("Sound Page clicked");
						page = eMenuMain_pages.sound;
						instance_destroy(button_SetGraphics);
						button_SetGraphics	= noone;
						instance_destroy(button_SetSound);
						button_SetSound = noone;
						instance_destroy(button_SetInput);
						button_SetInput = noone;
						instance_destroy(button_SetBack);
						button_SetBack	= noone;
					}
				}
				//Input Button
				if(button_SetInput != noone){
					if(button_SetInput.clicked){
						show_debug_message("Input Page clicked");
						page = eMenuMain_pages.input;
						instance_destroy(button_SetGraphics);
						button_SetGraphics	= noone;
						instance_destroy(button_SetSound);
						button_SetSound = noone;
						instance_destroy(button_SetInput);
						button_SetInput = noone;
						instance_destroy(button_SetBack);
						button_SetBack	= noone;
					}
				}
				//Back Button
				if(button_SetBack != noone){
					if(button_SetBack.clicked){
						show_debug_message("Back button clicked");
						page = eMenuMain_pages.main;						
						instance_destroy(button_SetGraphics);
						button_SetGraphics	= noone;
						instance_destroy(button_SetSound);
						button_SetSound = noone;
						instance_destroy(button_SetInput);
						button_SetInput = noone;
						instance_destroy(button_SetBack);
						button_SetBack	= noone;
					}
				}
				
			#endregion
			
	#endregion
	break;
	case eMenuMain_pages.graphics :
		#region | Graphics Menu
			#region | Creating Buttons 
				if(button_GraBack == noone){
					var _button_txt = "Back";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 + 64;
					button_GraBack = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_GraBack.txt = _button_txt;
					button_GraBack.image_xscale = string_width(_button_txt)/2;
					button_GraBack.image_yscale = string_height(_button_txt)/2;
				}
			#endregion
			
			#region | Clicking Buttons
				//Back Button
				if(button_GraBack != noone){
					if(button_GraBack.clicked){
						show_debug_message("Back button clicked");
						page = eMenuMain_pages.settings;
						instance_destroy(button_GraBack);
						button_GraBack	= noone;
					}
				}
			#endregion
		#endregion
	break;
	case eMenuMain_pages.sound :
		#region | Sound Menu
			#region | Creating Buttons 
				if(button_SoundBack == noone){
					var _button_txt = "Back";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 + 64;
					button_SoundBack = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_SoundBack.txt = _button_txt;
					button_SoundBack.image_xscale = string_width(_button_txt)/2;
					button_SoundBack.image_yscale = string_height(_button_txt)/2;
				}
			#endregion
			
			#region | Clicking Buttons
				//Back Button
				if(button_SoundBack != noone){
					if(button_SoundBack.clicked){
						show_debug_message("Back button clicked");
						page = eMenuMain_pages.settings;
						instance_destroy(button_SoundBack);
						button_SoundBack	= noone;
					}
				}
			#endregion
		#endregion
	break;
	case eMenuMain_pages.input :
		#region | Input Menu
			#region | Creating Buttons 
				if(button_InputBack == noone){
					var _button_txt = "Back";
					var _x = menu_width/2; //- string_width(_button_txt)/2;
					var _y = menu_height/2 + 64;
					button_InputBack = instance_create_depth(_x, _y, eInstanceDepth.close, oButton_text);
					button_InputBack.txt = _button_txt;
					button_InputBack.image_xscale = string_width(_button_txt)/2;
					button_InputBack.image_yscale = string_height(_button_txt)/2;
				}
			#endregion
			
			#region | Clicking Buttons
				//Back Button
				if(button_InputBack != noone){
					if(button_InputBack.clicked){
						show_debug_message("Back button clicked");
						page = eMenuMain_pages.settings;
						instance_destroy(button_InputBack);
						button_InputBack	= noone;
					}
				}
			#endregion
		#endregion
	break;
}
	
#region | Move Virtual Cursor
	var _dkey = input_check_pressed(eInputState.padd);
	var _ukey = input_check_pressed(eInputState.padu);
	var _lkey = input_check_pressed(eInputState.padl);
	var _rkey = input_check_pressed(eInputState.padr);

	virtualCursorVert_max = instance_number(oButton);

	//Down
	if((virtualCursor[0] < virtualCursorVert_max) && _dkey){
		virtualCursor[0] += 1;
	}else if(virtualCursor[0] > virtualCursorVert_max){ virtualCursor[0] = 0; }

	//Up
	if((virtualCursor[0] > 0) && _ukey){
		virtualCursor[0] -= 1;
	}else if(virtualCursor[0] < 0){ virtualCursor[0] = virtualCursorVert_max; }

	//Right
	if((virtualCursor[1] < virtualCursorHorz_max) && _rkey){
		virtualCursor[1] += 1;
	}else if(virtualCursor[1] > virtualCursorHorz_max){ virtualCursor[1] = 0; }

	//Left
	if((virtualCursor[1] > 0) && _lkey){
		virtualCursor[1] -= 1;
	}else if(virtualCursor[1] < 0){ virtualCursor[1] = virtualCursorHorz_max; }



	show_debug_message("Cursor[0]: " + string(virtualCursor[0]) + " / " + string(virtualCursorVert_max) + "Cursor[1]: " + string(virtualCursor[1]) + " / " + string(virtualCursorHorz_max));
#endregion
	
	