function menuSettings_goto_sound(){
	page = eMenuMain_pages.sound;
	for(var i = 0; i < array_length(menu_settings_options); i++){
		if(menu_settings_options[i] != noone){
			menu_settings_options[i].active = false;
		}
	}
	for(var l = 0; l < array_length(menu_sound_options); l++){
		if(menu_sound_options[l] != noone){
			menu_sound_options[l].active = true;
		}
	}
	
	if(scroll_bars[0] != noone){
		scroll_bars[0].active = true;
	}
	if(scroll_bars[1] != noone){
		scroll_bars[1].active = true;
	}
	if(scroll_bars[2] != noone){
		scroll_bars[2].active = true;
	}
	
	virtualCursor[0] = 0;
	virtualCursor[1] = 0;
}