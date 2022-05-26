///@description draw_animated_background(sprite, spd, xx, yy, xscale, yscale, col, alpha);
function draw_animated_background(sprite, spd, xspd, yspd, xx, yy, xscale, yscale, col, alpha){
	static subimg = 0;
	var _s = spd * global.DeltaMultiplyer;
	static _xs = 0;
	_xs += xspd * global.DeltaMultiplyer;
	static _ys = 0;
	_ys += yspd * global.DeltaMultiplyer;
	subimg += _s;
	draw_sprite_tiled_ext(sprite, subimg, xx+_xs, yy+_ys, xscale, yscale, col, alpha);
	var _cap = sprite_get_number(sprite);
	if(subimg > _cap){ subimg = 0; }
	if(_ys > 9999){ _ys = 0; } if(_xs > 9999){ _xs = 0; }
}