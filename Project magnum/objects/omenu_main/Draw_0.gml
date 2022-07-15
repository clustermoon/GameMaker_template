/// @description 

var ds_grid = menu_pages[page], ds_height = array_length(ds_grid);	// The data and its max height
var _x = menu_width/2;							// Positioning var 
var _y = menu_height/2 - menu_height/14;		// Positioning var
var _fs = 72 * 0.25;

if(page == eMenuMain_pages.input){
	_y = menu_height/2 - menu_height/3;	
}


draw_line(_x + 24, _y-14, _x + 24, _y+28*ds_height);



