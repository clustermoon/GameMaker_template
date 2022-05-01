function timer(amt, reset) {
	static _timer = amt;
	if(_timer > 0){
		_timer -= DeltaReal;	
	}else{
		if(reset){
			_timer = amt;	
		}
	}
	return _timer;
}