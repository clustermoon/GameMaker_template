/// @description Spawn Network Players

if(async_load[? "size"] > 0){
	var c_rec_buff = async_load[? "buffer"];
	buffer_seek(c_rec_buff, buffer_seek_start, 0);
	var message_id = buffer_read(c_rec_buff, buffer_string);
	
	var response = json_decode(message_id);

	if(ds_map_find_value(response, "type") == eNetworkMsgType.get_new_players){
		var players = ds_map_find_value(response, "players");

		//if(players != undefined){
		
			var num_curr_players = instance_number(oPlayer);
			if(num_curr_players > 0){	
				for (var i = 0; i < num_curr_players; ++i) {
					var _ext_player = instance_find(oPlayer, i);
					var _playerList_size = ds_list_size(players);
					for (var j = 0; j < _playerList_size; ++j) {
						var _player = ds_list_find_value(players, j);
						var _pn = ds_map_find_value(_player, "playerNumber");
						if(_pn ==_ext_player.playerNumber){
							ds_list_delete(players, j);
							_playerList_size = ds_list_size(players);
						}
				
					}
			
				}
			}
			
			
			var num_of_players_left = ds_list_size(players);
			for (var i = 0; i < num_of_players_left; ++i) {
				var _player = ds_list_find_value(players, i);
				var xx = ds_map_find_value(_player, "x");
				var yy = ds_map_find_value(_player, "y");
				var newPlayer = instance_create_layer(xx, yy, "Instances", oPlayer);
				if(i == 0){
					newPlayer.localPlayer = true;	
				}else{
					newPlayer.localPlayer = false;
				}
				newPlayer.playerNumber = ds_map_find_value(_player, "playerNumber");
			
			}
		//}
	
	}
}	

