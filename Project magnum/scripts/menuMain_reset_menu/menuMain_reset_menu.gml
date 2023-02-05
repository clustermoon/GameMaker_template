function menuMain_reset_menu(){
	oMenu_Main.padCursor = 0;
	oMenu_Main.start_count = 0;
	oMenu_Main.flag_past_start = false;
	oMenu_Main.flag_past_onlineSelection = false;
	oMenu_Main.flag_timedWait = false;
	oMenu_Main.flag_past_graphic = false;
	oMenu_Main.flag_timedWaitTwo = false;


	for(var i = 0; i < array_length(oMenu_Main.menu_pages[oMenu_Main.page]); i++){
		if(oMenu_Main.menu_pages[oMenu_Main.page][i, 3] != noone){
			instance_destroy(oMenu_Main.menu_pages[oMenu_Main.page][i, 3]); 	
			oMenu_Main.menu_pages[oMenu_Main.page][i, 3] = noone;
		}
	}
		
		
}