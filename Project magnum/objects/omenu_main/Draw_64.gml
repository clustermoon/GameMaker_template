/// @description Insert description here

draw_set_font(fntDebug);

var _c = c_white;
var _s = 0.35;
var _a = 0.5;
var _a_breathing = 0.5;
var _x, _y;

_x = menu_width/2;
_y = menu_height/2;

// Make alpha fluctate
alph_count += 0.01*alph_sign;
if(alph_count <= 0){ alph_sign = alph_sign*-1; }
if(alph_count >= 0.5){ alph_sign = alph_sign*-1; }

_a_breathing = alph_count;

// Draw the keys we are changing in the input settings menu
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



