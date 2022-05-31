/// @description 
if(!is_local) exit;

#region | Main Update loop
	if(!global.Pause){
		if(!is_dead){	
			#region | Move Player
				var hor = input_check_axis(eInputState.lStick_hAxis);
				var ver = input_check_axis(eInputState.lStick_vAxis);
			
				var _mspd = 3 * global.DeltaMultiplyer;
			
				x += hor * _mspd;
				y += ver * _mspd;
		
			#endregion

		}else{
			// Dead
		}
	}
#endregion

#region | Networking Send Packet
	if(global.MultiplayerGame){
		/*
		var buff = buffer_create(32, buffer_grow, 1);
		buffer_seek(buff, buffer_seek_start, 0);
		
		buffer_write(buff, buffer_u8, eNetwork.move);
		buffer_write(buff, buffer_u16, player_id);
		buffer_write(buff, buffer_s16, x);
		buffer_write(buff, buffer_s16, y);
		
		network_send_packet(global.NetworkServer, buff, buffer_tell(buff));
		buffer_delete(buff);
		*/
		
	}
#endregion
		
		


