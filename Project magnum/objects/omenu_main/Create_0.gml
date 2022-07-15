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
	["START",			menuMain_start_game],
	["SETTINGS",		menuMain_goto_settings],
	["EXIT",			menuMain_exit_game]
];
menu_main_options = array_create(array_length(ds_menu_main), noone);

// Settings Menu
ds_menu_settings = [
	["GRAPHICS",		menuSettings_goto_graphics],
	["SOUND",			menuSettings_goto_sound],
	["INPUT",			menuSettings_goto_input],
	["BACK",			menuSettings_back]
];
menu_settings_options = array_create(array_length(ds_menu_settings), noone);

// Graphics Menu
ds_menu_graphics = [
	["FULLSCREEN",		0],
	["RESOLUTION",		0],
	["V-SYNC",			0],
	["ANTI-ALIASING",	0],
	["BACK",			menuGraphics_back]
];
menu_graphics_options = array_create(array_length(ds_menu_graphics), noone);

// sound Menu
ds_menu_sound = [
	["MASTER",			0],
	["MUSIC",			0],
	["EFFECTS",			0],
	["BACK",			menuSound_back]
];
menu_sound_options = array_create(array_length(ds_menu_sound), noone);

// Input Menu
ds_menu_input = [
	["Left",				0],
	["Right",				0],
	["Down",				0],
	["Up",					0],
	["A-Button",			0],
	["B-Button",			0],
	["X-Button",			0],
	["Y-Button",			0],
	["Special 1",			0],
	["Special 2",			0],
	["Special 3",			0],
	["Special 4",			0],
	["Select",				0],
	["BACK",				menuInput_back]
];
menu_input_options = array_create(array_length(ds_menu_input), noone);



menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_graphics, ds_menu_sound, ds_menu_input];
menu_options = [menu_main_options, menu_settings_options, menu_graphics_options, menu_sound_options, menu_input_options];

