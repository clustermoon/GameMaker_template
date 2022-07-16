/// @description Insert description here
// You can write your code in this editor
if(active){
	var _dif = x - oCursor.x;
	var _perc = _dif/size;
	xx = x + _dif*-1;

	var _c = (abs(xx) - 47);
	_c = clamp(_c, 0, 100);
	var _p = _c/100;

	percent = _p;
}

