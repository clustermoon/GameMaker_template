/// @description 
if(!is_local) exit;

if(!global.Pause){
	if(!is_dead){
		
		#region | Move Player
			var hor = input_check_axis(eInputState.lStick_hAxis);
			var ver = input_check_axis(eInputState.lStick_vAxis);
			
			var _mspd = 3;
			
			x += hor * _mspd;
			y += ver * _mspd;
		
		#endregion
		
		#region | Networking Send Packet
			// Create buffer
			var buffer = buffer_create(100, buffer_fixed, 1);
			
			buffer_write(buffer, buffer_u8, eData.playerUpdate);
			buffer_write(buffer, buffer_u8, player_id);
			buffer_write(buffer, buffer_s16, x);
			buffer_write(buffer, buffer_s16, y);
			
			// Send packet to server
			if(!oManager_network.is_server){
				network_send_packet(global.NetworkServer, buffer, buffer_get_size(buffer));	
			}else{
				// Send position to clients
				for(var i = 0; i < ds_list_size(oManager_network.clients); i++){
					var soc = oManager_network.clients[| i];
					
					if(soc < 0) continue;
					
					network_send_packet(soc, buffer, buffer_get_size(buffer));
				}
			}
			
			buffer_delete(buffer);
			
		#endregion
		
		
	}else{
		
	}
}





