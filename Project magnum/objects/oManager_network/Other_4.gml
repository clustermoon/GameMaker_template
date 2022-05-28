/// @description 
if(room != rmMain && room != rmSplashScreen){
	// add player for some reason
	var plr = instance_create_depth(92, 92, depth, oPlayer);
	plr.player_id = 0;
	
	if(is_server){
		ds_list_add(clients, -1);	
	}
}




