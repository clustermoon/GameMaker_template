/// @description Insert description here
//Play_animation
//Play_animation
var _bgSpr, _bgSpd, _bgXspd, _bgYspd, _bgX, _bgY;
_bgSpr = bgSplashscreen_tile;
_bgSpd = 0;
_bgXspd = 0;
_bgYspd = -0.5;
_bgX = 0;
_bgY = 0;

var _spSpr, _spSpd, _spX, _spY, _spRot;
_spSpr = bgSplashscreen;
_spSpd = 0.025;
_spX = window_get_width()/2;
_spY = window_get_height()/2;
_spRot = 0;

draw_animated_background(_bgSpr, _bgSpd, _bgXspd, _bgYspd, _bgX, _bgY, 4, 4, c_white, 1);
draw_animated_sprite(_spSpr, _spSpd, _spX, _spY, 4, 4, _spRot, c_white, 1);

