function menuSettings_goto_input(){
	page = eMenuMain_pages.input;
	for(var i = 0; i < array_length(menu_settings_options); i++){
		if(menu_settings_options[i] != noone){
			menu_settings_options[i].active = false;
		}
	}
	for(var l = 0; l < array_length(menu_input_options); l++){
		if(menu_input_options[l] != noone){
			menu_input_options[l].active = true;
		}
	}
	virtualCursor[0] = 0;
	virtualCursor[1] = 0;
}