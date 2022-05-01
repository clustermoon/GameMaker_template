var _p_td = false;
var _p_ss = false;
if(instance_exists(oPlayerController_td)){
	_p_td = instance_find(oPlayerController_td, 0);
}
if(instance_exists(oPlayerController_ss)){
	_p_ss = instance_find(oPlayerController_ss, 0);
}

if(_p_td != noone || _p_ss != noone){
	if(View_Target == noone){
		if(_p_td){ View_Target = oPlayerController_td; } 
		if(_p_ss){ View_Target = oPlayerController_ss; } 
	}
}


