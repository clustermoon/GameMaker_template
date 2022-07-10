/// @description Draw Splash Screen
#region | Temp Vars
	var _bgSpr, _bgSpd, _bgXspd, _bgYspd, _bgX, _bgY;
	_bgSpr = bgSplashScreen_tile;
	_bgSpd = 0;
	_bgXspd = 0;
	_bgYspd = -0.5;
	_bgX = 0;
	_bgY = 0;

	var _spSpr, _spSpd, _spX, _spY, _spRot;
	_spSpr = bgSplashScreen;
	_spSpd = 0.025;
	_spX = global.WindowWidth_target/2;
	_spY = global.WindowHeight_target/2;
	_spRot = 0;

	var _scale = 4;
#endregion

#region | polish background
	angle += 5 * global.DeltaMultiplyer;

	var _dist = 35;
	var target_x = room_width/2;
	var target_y = room_height/2;

	_bgX = target_x + lengthdir_x(_dist, angle);
	_bgY = target_y + lengthdir_y(_dist, angle);

#endregion

#region | Draw animated background
	 var draw_background = function(sprite, spd, xspd, yspd, xx, yy, xscale, yscale, col, alpha){
		static subimg = 0;
		
		var _s = spd * global.DeltaMultiplyer;
		static _xs = 0;
		_xs += xspd *  global.DeltaMultiplyer;
		static _ys = 0;
		_ys += yspd *  global.DeltaMultiplyer;
		subimg += _s;

		draw_sprite_tiled_ext(sprite, subimg, xx+_xs, yy+_ys, xscale, yscale, col, alpha);
		var _cap = sprite_get_number(sprite);
		if(subimg > _cap){ subimg = 0; }
		if(_ys > 9999){ _ys = 0; } if(_xs > 9999){ _xs = 0; }
	}
	draw_background(_bgSpr, _bgSpd, _bgXspd, _bgYspd, _bgX, _bgY, _scale, _scale, c_white, 1);
#endregion

#region | Draw animated Sprite
	var draw_logo = function(sprite, spd, xx, yy, xscale, yscale, rot, col, alpha){
		static subimg = 0;
		var _s = spd *  global.DeltaMultiplyer;
		subimg += _s;
		draw_sprite_ext(sprite, subimg, xx, yy, xscale, yscale,  rot, col, alpha);
		var _cap = sprite_get_number(sprite);
		if(subimg > _cap){ subimg = 0; }
	}
	draw_logo(_spSpr, _spSpd, _spX, _spY, _scale/1.5, _scale/1.5, _spRot, c_white, 1);
#endregion


