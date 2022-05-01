// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_save(){
	if(file_exists(SaveFile)){ 
		
		Pause = false;
		load_game(SaveFile); 
		
	}
}