/// @description
var ds_grid = menu_pages[page], ds_height = array_length(ds_grid);//ds_grid_height(ds_grid);
var _x = menu_width/2;
var _y = menu_height/2;

//Create buttons
for(var i = 0; i < ds_height; i++){
			
	var _info = ds_grid[i];//ds_grid[# 0, i]
	var _txt = _info[0];
	
	var _moptions = menu_options[page];
	
	var _yspc = i * 32;
	if(_moptions[i] == noone){
		_moptions[i] = instance_create_depth(_x, _y + _yspc, eInstanceDepth.close, oButton_text);
		var _btn = _moptions[i];
				
		_btn.txt = _txt;
		_btn.image_xscale = string_width(_txt)/2;
		_btn.image_yscale = string_height(_txt)/2;
	}else{ break; }
}


#region | Virtual Cursor
	var _dkey = input_check_pressed(eInputState.padd);
	var _ukey = input_check_pressed(eInputState.padu);
	var _lkey = input_check_pressed(eInputState.padl);
	var _rkey = input_check_pressed(eInputState.padr);

	virtualCursorVert_max = ds_height;

	#region | Moving
		//Down
		if((virtualCursor[0] < virtualCursorVert_max-1) && _dkey){
			virtualCursor[0] += 1;
		}else if(virtualCursor[0] > virtualCursorVert_max-1){ virtualCursor[0] = 0; }

		//Up
		if((virtualCursor[0] > 0) && _ukey){
			virtualCursor[0] -= 1;
		}else if(virtualCursor[0] < 0){ virtualCursor[0] = virtualCursorVert_max-1; }

		//Right
		if((virtualCursor[1] < virtualCursorHorz_max) && _rkey){
			virtualCursor[1] += 1;
		}else if(virtualCursor[1] > virtualCursorHorz_max){ virtualCursor[1] = 0; }

		//Left
		if((virtualCursor[1] > 0) && _lkey){
			virtualCursor[1] -= 1;
		}else if(virtualCursor[1] < 0){ virtualCursor[1] = virtualCursorHorz_max; }
	#endregion
	
	//moving cursor and using it
	var _cursorOnButtons = false;
	var _enter = (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) || input_check_pressed(eInputState.aButton);

	with(oCursor){
		if(place_meeting(x,y, oButton)){
			_cursorOnButtons = true;	
		}
	}
	
	//Interact with stuff 
	if(_cursorOnButtons == false){
		for(var l = 0; l < virtualCursorVert_max; l++){	
			var page_option = menu_options[page];
			if(page_option[l] != noone){
				if(virtualCursor[0] == l){
					if(instance_exists(page_option[l])){ 
						page_option[l].lookedAt = true;  
						if(_enter){ page_option[l].clicked = !page_option[l].clicked; }
					}
				}
			}
		}
	}


#endregion

//When buttons get clicked
for(var j = 0; j < array_length(menu_options[page]); j++){
	var _button = menu_options[page];
	if(_button[j] != noone){
		if(instance_exists(_button[j])){ 
		if(_button[j].clicked == true){
			var _info = ds_grid[j];
			var _script = _info[0];
		
			show_debug_message(string(_info[0]) + " button was clicked!");
			script_execute(_info[1]);
		}
		}
	}
}


if(page != prevPage){
	var _options = menu_options[prevPage];
	var _len = array_length(_options)-1;
	var t = _len;
	repeat(t){
		instance_destroy(_options[t]);
		_options[t] = noone;
		t--;	
	}
}


if(prevPage != page){ prevPage = page; }



