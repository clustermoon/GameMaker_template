function menuSettings_back(){
	page = eMenuMain_pages.main;
	for(var i = 0; i < array_length(menu_settings_options); i++){
		if(menu_settings_options[i] != noone){
			menu_settings_options[i].active = false;
		}
	}
	
	for(var l = 0; l < array_length(menu_main_options); l++){
		if(menu_main_options[l] != noone){
			menu_main_options[l].active = true;
		}
	}
	virtualCursor[0] = 0;
	virtualCursor[1] = 0;
}