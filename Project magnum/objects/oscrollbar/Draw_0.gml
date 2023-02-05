/// @description Insert description here
// You can write your code in this editor
if(active){
	
	var _sclBase = scl;
	var _sclMax	 = scl*10;
	var _moveAmmnt = 0;

	var _scl = scl;

	var _x = x;

	if(hover || lookedAt){
		color = c_orange;	
		_scl = lerp(_scl, _sclMax, 0.025);
		_moveAmmnt = _sclMax - _sclBase;
		if(clicked || held || inputting){
			color = c_fuchsia;	
		}
	}else{ color = c_white; _scl = lerp(_scl, _sclBase, 0.025); }
	
	draw_line_color(x-size/2, y, x+size/2, y, color, color);
	draw_circle_color(xx, yy, 6, color, color, false);
}
