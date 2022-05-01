// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game(_save_name){
	var _sn = string(_save_name);
	if(file_exists(_sn)){ file_delete(_sn); }
	var _saveData = array_create(0);

	with(oEntity){
		var _saveEntity;
			_saveEntity = {
			obj : object_get_name(object_index),
			id : id,
			instance_id : instance_id,
			x : x, 
			y : y,
			entity_hspd : entity_hspd,
			entity_vspd : entity_vspd,
			room : room,
			image_index : image_index,
			image_blend : image_blend,
			image_alpha : image_alpha,
			image_xscale: image_xscale, 
			image_yscale : image_yscale,
			depth : depth,
			room : room
		}
		array_push(_saveData, _saveEntity);
	}
	
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _sn);
	buffer_delete(_buffer);
	show_debug_message("Game Saved! " + _string);
}

