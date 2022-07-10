var _track = oManager_network;
	if(instance_exists(_track)){
	debug_info = [
		"attempJoin: " + string(_track.attemptJoin),
		"joinSucceed: " + string(_track.joinSucceed),
		"retrieveHosts: " + string(_track.retrieveHosts),
		"recivedHosts: " + string(_track.recievedHosts),
		"numOfHosts: " + string(_track.number_of_hosts),
		"numOfPlayers: " + string(_track.number_of_players),
		"NetworkHostIsStop: " + string(global.NetworkIsHostStop),
		"NetworkHostShouldStop: " + string(global.NetworkShouldHostStop),
		"NetworkHostNumber: " + string(global.NetworkHostNumber),
		"NetworkPlayerNumber: " + string(global.NetworkPlayerNumber),
		"isHost: " + string(global.NetworkIsHost),
		"isConnected: " + string(global.NetworkIsConnected)
	];


	draw_set_font(fntDebug);
	var _string,  _s;
	_s = 0.25;

	for(var i = 0; i < array_length(debug_info); i++){
		_string = debug_info[i];
		var _yMod = 16*i;
		draw_text_transformed(86, 32+_yMod, _string, _s, _s, 0);
	}

}

