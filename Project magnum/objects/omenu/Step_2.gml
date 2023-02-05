/// @description Insert description here
// You can write your code in this editor

draw_set_font(fntDebug);

var _c = c_black;
var _s = 0.35;
var _a = 0.5;
var _x = menu_width/2, _y = menu_height/2;

if(page == 2){
	var _InputStr = [];
	if( global.CurrentInputDevice == eInputDevice.keyboard ){ _InputStr = global.InputList_keyboard; }else{ _InputStr = global.InputList_controller; }
	_s = 0.4;
		
	for(var i = 0; i < array_length(_InputStr); i++){
		if(i < 8){
			draw_text_transformed_color(_x+32, (_y-110) + 32*i, " : " + key_to_string(_InputStr[i]), _s, _s, 0, _c, _c, _c, _c, _a);
		}
	}
}
	
if(page == 4){
	draw_text_transformed_color((_x - 72) - string_width("MASTER :")*_s, _y-105, "MASTER :", _s, _s, 0, _c, _c, _c, _c, _a);
	draw_text_transformed_color((_x - 72) - string_width("EFFECTS :")*_s, _y-45, "EFFECTS :", _s, _s, 0, _c, _c, _c, _c, _a);
	draw_text_transformed_color((_x - 72) - string_width("MUSIC :")*_s, _y+25, "MUSIC :", _s, _s, 0, _c, _c, _c, _c, _a);
		
}













