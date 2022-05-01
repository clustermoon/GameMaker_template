///@description draw_animated_sprite(sprite, spd, xx, yy, xscale, yscale, rot, col, alpha);
///@arg sprite
///@arg spd
///@arg xx
///@arg yy
///@arg xscale
///@arg yscale
///@arg rot
///@arg col
///@arg alpha
function draw_animated_sprite(sprite, spd, xx, yy, xscale, yscale, rot, col, alpha){
	static subimg = 0;
	var _s = spd * DeltaMultiplyer;
	subimg += _s;
	draw_sprite_ext(sprite, subimg, xx, yy, xscale, yscale,  rot, col, alpha);
	var _cap = sprite_get_number(sprite);
	if(subimg > _cap){ subimg = 0; }
}