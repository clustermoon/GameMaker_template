// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menuJoinMenu_back(){
	
	for(var i = 0; i < array_length(oMenu_Main.menu_pages[oMenu_Main.page]); i++){
		if(oMenu_Main.menu_pages[oMenu_Main.page][i, 3] != noone){
			instance_destroy(oMenu_Main.menu_pages[oMenu_Main.page][i, 3]); 	
			oMenu_Main.menu_pages[oMenu_Main.page][i, 3] = noone;
		}
	}
	
	oMenu_Main.page = 6;

}