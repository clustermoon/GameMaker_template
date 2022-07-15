/// @description Insert description here
// You can write your code in this editor

if(active){
	var _sclBase = scl;
	var _sclMax	 = scl*10;
	var _moveAmmnt = 0;

	var _scl = scl;

	var _x = x;

	if(hover){
		color = c_orange;	
		_scl = lerp(_scl, _sclMax, 0.025);
		_moveAmmnt = _sclMax - _sclBase;
		if(clicked || held){
			color = c_fuchsia;	
		}
	}else{ color = c_white; _scl = lerp(_scl, _sclBase, 0.025); }

	draw_text_transformed_color((x-_moveAmmnt/2) - string_width(txt)/2, (y - _moveAmmnt/2) - string_height(txt)/2, txt, _scl, _scl, 0, color, color, color, color, alph);

}
