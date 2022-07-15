function menuSettings_goto_graphics(){
	page = eMenuMain_pages.graphics;
	for(var i = 0; i < array_length(menu_settings_options); i++){
		if(menu_settings_options[i] != noone){
			menu_settings_options[i].active = false;
		}
	}
	for(var l = 0; l < array_length(menu_graphics_options); l++){
		if(menu_graphics_options[l] != noone){
			menu_graphics_options[l].active = true;
		}
	}
	virtualCursor[0] = 0;
	virtualCursor[1] = 0;
}