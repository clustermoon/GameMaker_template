function menuSound_back(){
	page = eMenuMain_pages.settings;
	for(var i = 0; i < array_length(menu_sound_options); i++){
		if(menu_sound_options[i] != noone){
			menu_sound_options[i].active = false;
		}
	}
	
	for(var l = 0; l < array_length(menu_settings_options); l++){
		if(menu_settings_options[l] != noone){
			menu_settings_options[l].active = true;
		}
	}
	
	scroll_bars[0].active = false;
	scroll_bars[1].active = false;
	scroll_bars[2].active = false;
	
	
	virtualCursor[0] = 0;
	virtualCursor[1] = 0;
}