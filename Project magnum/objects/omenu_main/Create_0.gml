/// @description 
// Inherit the parent event
event_inherited();

page = 0;
enum eMenuMain_pages {
	main,
	settings,
	graphics,
	sound,
	input
}
/******************\
| 0		|  Main	   |
| 1		|  Settings|
| 2		|  Graphics|
| 3		|  Sound   |
| 4		|  Input   |
\******************/

//Main Buttons
button_MainStart	= noone;
button_MainSettings = noone;
button_MainExit		= noone;
main_options = array_create(3, 0);

//Settings Buttons
button_SetGraphics	= noone;
button_SetSound		= noone;
button_SetInput		= noone;
button_SetBack		= noone;
settings_options = array_create(4, 0);


//Graphics Buttons
button_GraBack		= noone;
main_options = array_create(1, 0);


//Sound Buttons
button_SoundBack	= noone;
main_options = array_create(1, 0);


//Input Buttons
button_InputBack	= noone;
main_options = array_create(1, 0);


virtualCursorVert_max	= 0;
virtualCursorHorz_max	= 0;
virtualCursor		= [0, 0];