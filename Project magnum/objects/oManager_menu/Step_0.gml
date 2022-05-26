if(room == rmMain){
	var _dw = room_width/4;
	var _dh = room_height/4;
	var _hOffset = 160;
	var _vOffset = 72;	
	
	var ukey = input_check_pressed(eInputState.padu);
	var dkey = input_check_pressed(eInputState.padd);
	
	#region | Virtual Cursor
		if(dkey){ cursor++;} 
		if(ukey){ cursor--;}
		show_debug_message(cursor);
	#endregion
	
	switch(current_page){
	case eMenuPages.main:
		var keys = variable_struct_get_names(Page_Main);
		for(var i = 0; i <= array_length(keys)-1; i++){ 
			var k = keys[i];
			
			#region | cursor
				var _mx = array_length(keys)-1;
				if(cursor < 0){ cursor = _mx; }else if(cursor > _mx){ cursor = 0; } 
			#endregion
			
			#region | Create buttons
				if(Page_Main_buttons[i] == noone){
					var pad = 6;
					Page_Main_buttons[i] = instance_create_depth((_dw - _hOffset) - pad,
																									  _dh + (i*_vOffset) - pad,
																									  depth, 
																									  oButton);
				}else{
					var pad = 6;
					Page_Main_buttons[i].image_xscale = string_width(k) + pad;
					Page_Main_buttons[i].image_yscale = string_height(k) + pad;
				}
			#endregion
			
		
		}
	break;
	}
	
	
	
}

