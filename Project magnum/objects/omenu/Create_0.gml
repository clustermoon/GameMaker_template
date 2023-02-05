/// @description Insert description here
// You can write your code in this editor
padCursor = 0;
preventCursor = false;
menu_width = global.WindowWidth_target
menu_height = global.WindowHeight_target

enum eMenu_element_type {
	script_runner, 
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

cursor = noone;
