/// @description 
// Inherit the parent event
event_inherited();

virtualCursorVert_max	= 0;
virtualCursorHorz_max	= 0;
virtualCursor		= [0, 0];

page = 0;
prevPage = page;
enum eMenuMain_pages {
	main,
	settings,
	graphics,
	sound,
	input
}

// Main Menu
ds_menu_main = [
	["START",		menuMain_start_game],
	["SETTINGS",	menuMain_goto_settings],
	["EXIT",		menuMain_exit_game]
];
menu_main_options = array_create(array_length(ds_menu_main), noone);

// Settings Menu
ds_menu_settings = [
	["GRAPHICS", 0],
	["SOUND", 0],
	["INPUT", 0],
	["BACK", menuSettings_back]
];
menu_settings_options = array_create(array_length(ds_menu_settings), noone);

// Settings Menu
ds_menu_graphics = [
	["FULLSCREEN", 0],
	["RESOLUTION", 0],
	["V-SYNC", 0],
	["ANTI-ALIASING", 0]
	["BACK", menuGraphics_back]
];
menu_graphics_options = array_create(array_length(ds_menu_settings), noone);



menu_pages = [ds_menu_main, ds_menu_settings];
menu_options = [menu_main_options, menu_settings_options];


/******************\
| 0		|  Main	   |
| 1		|  Settings|
| 2		|  Graphics|
| 3		|  Sound   |
| 4		|  Input   |
\******************/
