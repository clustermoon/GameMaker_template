function load_game(_save_name){
	with(oEntity){ instance_destroy(); }
	if(file_exists(string(_save_name))){
		var _buffer = buffer_load(string(_save_name));
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);	
		
		var _room;
		
		var _loadData = json_parse(_string);
		while(array_length(_loadData) > 0){
			var _loadEntity = array_pop(_loadData);
			with(instance_create_depth(0, 0, _loadEntity.depth, asset_get_index(_loadEntity.obj))){
				x = _loadEntity.x;
				y = _loadEntity.y
				entity_hspd = _loadEntity.entity_hspd;
				entity_vspd = _loadEntity.entity_vspd;
				image_alpha = _loadEntity.image_alpha;
				image_blend = _loadEntity.image_blend;
				image_index = _loadEntity.image_index;
				image_xscale = _loadEntity.image_xscale;
				image_yscale = _loadEntity.image_yscale;
				_room = _loadEntity.room;
			}
		}
		room_goto(_room);
		show_debug_message("Game Loaded! " + _string);
	}
}

