function menuSettings_goto_input(){
	
	for(var i = 0; i < array_length(oMenu_Main.menu_pages[oMenu_Main.page]); i++){
		if(oMenu_Main.menu_pages[oMenu_Main.page][i, 3] != noone){
			instance_destroy(oMenu_Main.menu_pages[oMenu_Main.page][i, 3]); 	
			oMenu_Main.menu_pages[oMenu_Main.page][i, 3] = noone;
		}
	}
	
	oMenu_Main.page = 2;
}