/// @description 

var ds_grid = menu_pages[page], ds_height = array_length(ds_grid);	// The data and its max height
var _x = menu_width/2;							// Positioning var 
var _y = menu_height/2 - menu_height/14;		// Positioning var
var _fs = 72 * 0.25;
//draw_set_font(fntDebug);
var _s = 0.25;

if(page == eMenuMain_pages.input){
	_y = menu_height/2 - menu_height/3;	
}


draw_line(_x + 24, _y-14, _x + 24, _y+28*ds_height);


#region | right side
	_x = menu_width/2 + 64;

	switch(page){
		case eMenuMain_pages.input:
			for(var i = 0; i < ds_height-1; i++){
				var _yspc = i * 32;
				_y = menu_height/2 - menu_height/3 - 16;	
				var _c = c_white;
				if(i == virtualCursor[0]){
					if(inputting){ _c = c_orange; }else{ _c = c_white; }
				}
				if(global.CurrentInputDevice == eInputDevice.keyboard){
					draw_text_transformed_color(_x, _y+_yspc, key_to_string(global.InputList_keyboard[i]), _s,_s, 0, _c, _c,_c,_c,1);
				}else{
					draw_text_transformed_color(_x, _y+_yspc, key_to_string(global.InputList_controller[i]), _s,_s, 0, _c, _c,_c,_c,1);
				}
			}
			
		break;
		case eMenuMain_pages.sound:
			for(var i = 0; i < ds_height-1; i++){
				var _yspc = i * 32;
				_y = menu_height/2 - 40;	
				_x = menu_width/2 + 100;
				var _c = c_white;
			
				if(scroll_bars[i] == noone){
					scroll_bars[i] = instance_create_depth(_x, _y+_yspc, depth, oScrollBar);	
				}
			}
		break;
		case eMenuMain_pages.graphics:
			for (var i = 0; i < ds_height; ++i) {
			   var _yspc = i * 32;
				_y = menu_height/2 - 50;	
				_x = menu_width/2 + 48;
				var _c = c_white;
				if(i == virtualCursor[0]){
					if(inputting){ _c = c_orange; }else{ _c = c_white; }
				}
				var _graphic_set = oManager_system.graphics_settings[i];
				if(oManager_system.graphics_settings[i] == 1){
					var _gs = oManager_system.graphics_settings[i];
					_graphic_set[0] = _gs[0];	
				}
				draw_text_transformed_color(_x, _y+_yspc, string(_graphic_set[0]), _s, _s, 0, _c, _c, _c, _c, 1);
				
			}
		break;
	}

#endregion


