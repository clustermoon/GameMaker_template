/// @description Initialize game managers
var _managers = [oSystem, oCamera, oSoundManager, oTextManager, oMenuManager];

for(var i = 0; i < array_length(_managers); i++){
	if(!instance_exists(_managers[i])){
		instance_create_depth(x, y, depth-i, _managers[i]);
	}
}


