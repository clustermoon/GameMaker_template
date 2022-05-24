/// @description Update Camera
#region | Update camera


	var _p = View_Target;

	
	
	if(instance_exists(_p)){
		var _viewX = camera_get_view_x(View);
		var _viewY = camera_get_view_y(View);
		var _viewW = camera_get_view_width(View);
		var _viewH = camera_get_view_height(View);

		var _hAdjustment = 100;
		var _vAdjustment = 100;
		var _gotoX = _p.x - (_viewW * 0.5);
		var _gotoY = _p.y - (_viewH*0.5);

		var _panSpeed = 0.25;
		var _newX = lerp(_viewX, _gotoX, _panSpeed);
		var _newY = lerp(_viewY, _gotoY, _panSpeed);
	
		var _factor = 0.2;	
		var _lerpH = lerp(_viewH, ZoomF * View_Height, _factor);
		var _newH = clamp(_lerpH, 0, room_height);var _newW = _newH * (View_Width / View_Height);
	
		var _offsetX = _newX - (_newW - _viewW) * 0.5;
		var _offsetY = _newY - (_newH - _viewH) * 0.5;
		_newX = clamp(_offsetX, 0, room_width - _newW);
		_newY = clamp(_offsetY, 0, room_height - _newH);
	
		
		if(ShakeMag > 0.1){
			ShakeMag -= ShakeMag/5;	
		}else{ ShakeMag = 0; }

		camera_set_view_angle(View, -ShakeMag + random(ShakeMag * 2));
		camera_set_view_size(View, _newW, _newH);
		camera_set_view_pos(View, _newX, _newY);
		//surface_resize(application_surface, View_Width, View_Height);
	
	}
	
#endregion
//----------------------------------------------------------------------------------
