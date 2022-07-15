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
	virtualCursor[0] = 0;
	virtualCursor[1] = 0;
}