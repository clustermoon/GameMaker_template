/// @description 

padCursor = 0;
start_count = 0;
preventCursor = false;

// Inherit the parent event
event_inherited();

alph_count = 0;
alph_sign = 1;

selc_alpha_a = 0.5;
selc_alpha_b = 0.25;


menu_main = [
	// name ,				 menu element                    , script				 , button obj
	["PLAY",				 eMenu_element_type.script_runner, menuMain_start_game   , noone],
	["SETTINGS",			 eMenu_element_type.script_runner, menuMain_goto_settings, noone],
	//["GO ONLINE",			 eMenu_element_type.script_runner, menuMain_reset_menu   , noone],
	["QUIT",				 eMenu_element_type.script_runner, menuMain_exit_game    , noone]
];
menu_settings = [
	["INPUT",				 eMenu_element_type.script_runner, menuSettings_goto_input,       noone],
	["GRAPHICS",			 eMenu_element_type.script_runner, menuSettings_goto_graphics,    noone],
	["SOUND",				 eMenu_element_type.script_runner, menuSettings_goto_sound,       noone],
	["MULTIPLAYER",			 eMenu_element_type.script_runner, menuSettings_goto_multiplayer, noone],
	["BACK",				 eMenu_element_type.script_runner, menuSettings_back,             noone]
];

menu_input = [
	["LEFT",				 eMenu_element_type.script_runner, change_input,   noone],
	["RIGHT",				 eMenu_element_type.script_runner, change_input,   noone],
	["DOWN",				 eMenu_element_type.script_runner, change_input,   noone],
	["UP",					 eMenu_element_type.script_runner, change_input,   noone],
	["A",					 eMenu_element_type.script_runner, change_input,   noone],
	["B",					 eMenu_element_type.script_runner, change_input,   noone],
	["X",					 eMenu_element_type.script_runner, change_input,   noone],
	["Y",					 eMenu_element_type.script_runner, change_input,   noone],
	["RESET TO DEFAULT",	 eMenu_element_type.script_runner, reset_inputs,   noone],
	["BACK",				 eMenu_element_type.script_runner, menuInput_back, noone]
];


menu_graphics = [
	["FULLSCREEN",			 eMenu_element_type.script_runner, menuGraphics_fullscreen,    noone],
	["BACK",				 eMenu_element_type.script_runner, menuGraphics_back,    noone]
];


menu_sound = [
	["MASTER",				 eMenu_element_type.script_runner, change_volume,   noone, audiogroup_default],
	["MUSIC",				 eMenu_element_type.script_runner, change_volume,   noone, audiogroup_soundeffects],
	["EFFECTS",				 eMenu_element_type.script_runner, change_volume,   noone, audiogroup_music],
	["BACK",				 eMenu_element_type.script_runner, menuSound_back,  noone]
]; 


menu_multiplayer = [
	["BACK",				 eMenu_element_type.script_runner, menuMultiplayer_back, noone]
];

menu_onlineMenu = [
	["HOST",				 eMenu_element_type.script_runner, menuOnline_host_game   , noone],
	["JOIN",				 eMenu_element_type.script_runner, menuOnline_join_game   , noone],
	["SETTINGS",			 eMenu_element_type.script_runner, menuOnline_goto_settings, noone],
	//["GO OFFLINE",			 eMenu_element_type.script_runner, menuMain_reset_menu   , noone],
	["QUIT",				 eMenu_element_type.script_runner, menuMain_exit_game    , noone]
];

menu_joinMenu = [
	//["BACK",				 eMenu_element_type.script_runner, menuJoinMenu_back, noone]
];


menu_pages = [
	menu_main,				// 0
	menu_settings,			// 1
	menu_input,				// 2
	menu_graphics,			// 3
	menu_sound,				// 4
	menu_multiplayer,		// 5
	menu_onlineMenu,		// 6
	menu_joinMenu			// 7
];
page = 0;

