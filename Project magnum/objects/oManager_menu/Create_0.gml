//display_set_gui_size(View_Width, View_Height);

enum menu_page {
	main, 
	pause, 
	settings, 
	sound,
	graphics,
	controls,
	height
}

enum menu_element_type {
	script_runner, 
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

///Create Menu Pages
ds_menu_main = create_menu_page(
	["START",						menu_element_type.script_runner,		start_game],
	["LOAD",						menu_element_type.script_runner,		load_save],
	["SETTINGS",					menu_element_type.page_transfer,		menu_page.settings],
	["EXIT",							menu_element_type.script_runner,		exit_game]
);

ds_menu_pause = create_menu_page(
	["RESUME",					menu_element_type.script_runner,		resume_game],
	["MAIN MENU",				menu_element_type.script_runner,		room_goto_menu]
);

ds_menu_settings = create_menu_page(
	["SOUND",						menu_element_type.page_transfer,		menu_page.sound],
	["GRAPHICS",					menu_element_type.page_transfer,		menu_page.graphics],
	["CONTROLS",				menu_element_type.page_transfer,		menu_page.controls],
	["BACK",							menu_element_type.page_transfer,		menu_page.main]
);

ds_menu_sound = create_menu_page(
	["MASTER",					menu_element_type.slider,						change_volume,				1,		[0, 1]],
	["EFFECTS",					menu_element_type.slider,						change_volume,				1,		[0, 1]],
	["MUSIC",						menu_element_type.slider,						change_volume,				1,		[0, 1]],
	["BACK",							menu_element_type.page_transfer,		menu_page.settings]
);

ds_menu_graphics = create_menu_page(
	["WINDOW MODE",		menu_element_type.toggle,					change_window_mode,	1,		["Fullscreen", "Windowed"]],
	["RESOLUTION",			menu_element_type.shift,						change_resolution,			1,		["480x270", "960x540", "1920x1080"]],
	["BACK",							menu_element_type.page_transfer,		menu_page.settings]
);

ds_menu_controls = create_menu_page(
	["CHANGE INPUT",		menu_element_type.shift,						change_controller_type,		0,		["Keyboard", "Controller"]],						
	["BACK",							menu_element_type.page_transfer,		menu_page.settings]
);

page = 0;
menu_pages = [ds_menu_main, ds_menu_pause, ds_menu_settings, ds_menu_sound, ds_menu_graphics, ds_menu_controls];

var i = 0, array_len = array_length(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

pause_pages = [ds_menu_pause, ds_menu_main, ds_menu_settings, ds_menu_sound, ds_menu_graphics, ds_menu_controls];

var i = 0, array_len = array_length(menu_pages);
repeat(array_len){
	pause_option[i] = 0;
	i++;
}


inputting = false;

