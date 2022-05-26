if(room == rmMain){
	var _dw = room_width/4;
	var _dh = room_height/4;
	var _hOffset = 160;
	var _vOffset = 72;	
	
	switch(current_page){
		case eMenuPages.main:
			var keys = variable_struct_get_names(Page_Main);
			for(var i = 0; i <= array_length(keys)-1; i++){ 
				var k = keys[i];
			    var v = Page_Main[$ k];
	
				draw_set_font(fntDebug_36);
				var _c = c_white;
				 
				 if(k == cursor){ _c = c_red; }
				 
				draw_text_color(_dw - _hOffset ,_dh + (i*_vOffset), string(k), _c, _c, _c, _c, 1);
	
			}
		break;
	}
	
}


