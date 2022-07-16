/// @description 
// Inherit the parent event
event_inherited();

virtualCursorVert_max	= 0;
virtualCursorHorz_max	= 0;
virtualCursor		= [0, 0];

page = 0;
prevPage = page;

inputting = false;

enum eMenuMain_pages {
	main,
	settings,
	graphics,
	sound,
	input
}

// Main Menu
ds_menu_main = [
	["START",			menuMain_start_game, -1],
	["SETTINGS",		menuMain_goto_settings, -1],
	["EXIT",			menuMain_exit_game, -1]
];
menu_main_options = array_create(array_length(ds_menu_main), noone);

// Settings Menu
ds_menu_settings = [
	["GRAPHICS",		menuSettings_goto_graphics, -1],
	["SOUND",			menuSettings_goto_sound, -1],
	["INPUT",			menuSettings_goto_input, -1],
	["BACK",			menuSettings_back, -1]
];
menu_settings_options = array_create(array_length(ds_menu_settings), noone);

// Graphics Menu
ds_menu_graphics = [
	["FULLSCREEN",		0, -1],
	["RESOLUTION",		0, -1],
	["V-SYNC",			0, -1],
	["ANTI-ALIASING",	0, -1],
	["BACK",			menuGraphics_back, -1]
];
menu_graphics_options = array_create(array_length(ds_menu_graphics), noone);

// sound Menu
ds_menu_sound = [
	["MASTER",			0, -1],
	["MUSIC",			0, -1],
	["EFFECTS",			0, -1],
	["BACK",			menuSound_back, -1]
];
menu_sound_options = array_create(array_length(ds_menu_sound), noone);

// Input Menu
ds_menu_input = [
	["Left",				change_input, eInputList.a],
	["Right",				change_input, eInputList.d],
	["Down",				change_input, eInputList.s],
	["Up",					change_input, eInputList.w],
	["A-Button",			change_input, eInputList.aBtn],
	["B-Button",			change_input, eInputList.bBtn],
	["X-Button",			change_input, eInputList.xBtn],
	["Y-Button",			change_input, eInputList.yBtn],
	["Special 1",			change_input, eInputList.rBmp],
	["Special 2",			change_input, eInputList.rTrg],
	["Special 3",			change_input, eInputList.lBmp],
	["Special 4",			change_input, eInputList.lTrg],
	["Select",				change_input, eInputList.select],
	["BACK",				menuInput_back, -1]
];
menu_input_options = array_create(array_length(ds_menu_input), noone);



menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_graphics, ds_menu_sound, ds_menu_input];
menu_options = [menu_main_options, menu_settings_options, menu_graphics_options, menu_sound_options, menu_input_options];

freeze_cursor = false;

scroll_bars = array_create(3, noone);

