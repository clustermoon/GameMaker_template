function menuSettings_back(){
	
	for(var i = 0; i < array_length(oMenu_Main.menu_pages[oMenu_Main.page]); i++){
		if(oMenu_Main.menu_pages[oMenu_Main.page][i, 3] != noone){
			instance_destroy(oMenu_Main.menu_pages[oMenu_Main.page][i, 3]); 	
			oMenu_Main.menu_pages[oMenu_Main.page][i, 3] = noone;
		}
	}
	
	if(global.MultiplayerGame){
		oMenu_Main.page = 6;
	}else{
		oMenu_Main.page = 0;
	}
	
}