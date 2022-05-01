if(room == rmMenu){
		var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
	var y_buffer = 128, x_buffer = 64;
	var start_y = (View_Height/2) - ((((ds_height-1)/2) * y_buffer)), start_x = View_Width/2;
	var _c = c_black
	var _f = fntDebug_52;
	
	
	draw_set_font(_f);
	
	//Draw Background
	draw_animated_background(bgPlaceholder, 0, 0.5, -0.5, 0, 0, 1, 1, c_white, 1);
	
	//Draw Elements left
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	var ltx = start_x - x_buffer, lty, xo;
	
	var yy = 0; repeat(ds_height){
		lty = start_y + (yy*y_buffer);
		_c = c_black;
		xo = 0;
		
		if(yy == menu_option[page]){
			_c = c_white;
			xo = + (x_buffer/2);
		}
		
		draw_text_color(ltx-xo, lty, ds_grid[# 0, yy], _c , _c, _c, _c, 1);
		yy++;
	}
	
	
	//Draw Dividing line
	draw_line(start_x, start_y-y_buffer, start_x, lty+y_buffer);
	
	//Draw Elements left
	draw_set_halign(fa_left);
	var rtx = start_x + x_buffer, rty;
	
	yy = 0; repeat(ds_height){
	rty = start_y + (yy*y_buffer);
		
		switch(ds_grid[# 1, yy]){
			case menu_element_type.shift:  
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var left_shift = "<< ";
				var right_shift = " >>";
				_c = c_white;
				
				if(current_val == 0){ left_shift = ""; }
				if(current_val == array_length(ds_grid[#4, yy])-1){ right_shift = ""; }
				
				if(inputting && yy == menu_option[page]){ _c = c_yellow; } 

				draw_text_color(rtx, rty, left_shift + current_array[current_val] + right_shift, _c, _c, _c, _c, 1);
				
			break;
			case menu_element_type.slider:
				var len = 128;
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[#4, yy];
				var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
				_c = c_white;
				
				draw_line_width(rtx, rty, rtx + len, rty, 2);
				
				if(inputting && yy == menu_option[page]){ _c = c_yellow; } 
				
				draw_circle_color(rtx + (circle_pos*len), rty, 4, _c, _c, false);
				draw_text_color(rtx + (len*1.2), rty, string(floor(circle_pos*100)) + "%", _c, _c, _c, _c, 1);
			break;
			case menu_element_type.toggle:
				var current_val = ds_grid[# 3, yy];
				var _c1, _c2;
				_c = c_white;
				
				if(inputting && yy == menu_option[page]){ _c = c_yellow; } 
				
				if(current_val == 0){ _c1 = _c; _c2 = c_dkgray; }else{ _c2 = _c; _c1 = c_dkgray; }
				
				draw_text_color(rtx, rty, "ON", _c1, _c1, _c1, _c1, 1);
				draw_text_color(rtx + 128, rty, "OFF", _c2, _c2, _c2, _c2, 1);
				
			break;
		}	
		yy++;
	}

	draw_set_valign(fa_top);
}else{
	if(!Pause){ exit;}
	var ds_grid = pause_pages[page], ds_height = ds_grid_height(ds_grid);
	var y_buffer = 128, x_buffer = 64;
	var start_y = (View_Height/2) - ((((ds_height-1)/2) * y_buffer)), start_x = View_Width/2;
	var _c = c_black
	var _f = fntDebug_52;
	
	
	draw_set_font(_f);
	
	//Draw Background
	draw_animated_background(bgPlaceholder, 0, 0.5, -0.5, 0, 0, 1, 1, c_white, 1);
	
	//Draw Elements left
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	var ltx = start_x - x_buffer, lty, xo;
	
	var yy = 0; repeat(ds_height){
		lty = start_y + (yy*y_buffer);
		_c = c_black;
		xo = 0;
		
		if(yy == pause_option[page]){
			_c = c_white;
			xo = + (x_buffer/2);
		}
		
		draw_text_color(ltx-xo, lty, ds_grid[# 0, yy], _c , _c, _c, _c, 1);
		yy++;
	}
	
	
	//Draw Dividing line
	draw_line(start_x, start_y-y_buffer, start_x, lty+y_buffer);
	
	//Draw Elements left
	draw_set_halign(fa_left);
	var rtx = start_x + x_buffer, rty;
	
	yy = 0; repeat(ds_height){
	rty = start_y + (yy*y_buffer);
		
		switch(ds_grid[# 1, yy]){
			case menu_element_type.shift:  
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var left_shift = "<< ";
				var right_shift = " >>";
				_c = c_white;
				
				if(current_val == 0){ left_shift = ""; }
				if(current_val == array_length(ds_grid[#4, yy])-1){ right_shift = ""; }
				
				if(inputting && yy == pause_option[page]){ _c = c_yellow; } 

				draw_text_color(rtx, rty, left_shift + current_array[current_val] + right_shift, _c, _c, _c, _c, 1);
				
			break;
			case menu_element_type.slider:
				var len = 128;
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[#4, yy];
				var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
				_c = c_white;
				
				draw_line_width(rtx, rty, rtx + len, rty, 2);
				
				if(inputting && yy == pause_option[page]){ _c = c_yellow; } 
				
				draw_circle_color(rtx + (circle_pos*len), rty, 4, _c, _c, false);
				draw_text_color(rtx + (len*1.2), rty, string(floor(circle_pos*100)) + "%", _c, _c, _c, _c, 1);
			break;
			case menu_element_type.toggle:
				var current_val = ds_grid[# 3, yy];
				var _c1, _c2;
				_c = c_white;
				
				if(inputting && yy == pause_option[page]){ _c = c_yellow; } 
				
				if(current_val == 0){ _c1 = _c; _c2 = c_dkgray; }else{ _c2 = _c; _c1 = c_dkgray; }
				
				draw_text_color(rtx, rty, "ON", _c1, _c1, _c1, _c1, 1);
				draw_text_color(rtx + 128, rty, "OFF", _c2, _c2, _c2, _c2, 1);
				
			break;
		}	
		yy++;
	}

	draw_set_valign(fa_top);
	
}




