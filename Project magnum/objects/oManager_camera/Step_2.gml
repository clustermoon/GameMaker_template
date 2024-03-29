/// @description Update Camera
#region | Update camera
		var _p = View_Target;
		var _InputH = input_check_axis(global.GamePad ,eInputState.lStick_hAxis);
		var _InputV = input_check_axis(global.GamePad ,eInputState.lStick_vAxis);
		
		var _viewX = camera_get_view_x(global.Camera);
		var _viewY = camera_get_view_y(global.Camera);
		var _viewW = camera_get_view_width(global.Camera);
		var _viewH = camera_get_view_height(global.Camera);

		var _hAdjustment = 50;
		var _vAdjustment = 50;
		if(instance_exists(_p)){
			gotoX = _p.x + (_InputH * _hAdjustment) - (_viewW * 0.5);
			gotoY = _p.y + (_InputV * _vAdjustment) - (_viewH*0.5);
		}

		var _panSpeed = 0.25;
		var _newX = lerp(_viewX, gotoX, _panSpeed);
		var _newY = lerp(_viewY, gotoY, _panSpeed);
	
		var _factor = 0.2;	
		var _lerpH = lerp(_viewH, global.CameraZoom * global.CameraHeight, _factor);
		var _newH = clamp(_lerpH, 0, room_height);var _newW = _newH * (global.CameraWidth / global.CameraHeight);
	
		var _offsetX = _newX - (_newW - _viewW) * 0.5;
		var _offsetY = _newY - (_newH - _viewH) * 0.5;
		_newX = clamp(_offsetX, 0, room_width - _newW);
		_newY = clamp(_offsetY, 0, room_height - _newH);
	
		
		if(global.CameraShake > 0.1){
			global.CameraShake -= global.CameraShake/5;	
		}else{ global.CameraShake = 0; }

		camera_set_view_angle(global.Camera, -global.CameraShake + random(global.CameraShake * 2));
		camera_set_view_size(global.Camera, _newW, _newH);
		camera_set_view_pos(global.Camera, _newX, _newY);
		//surface_resize(application_surface, global.CameraWidth, global.CameraHeight);
	
		/*
		if (!surface_exists(view_surf)) {
			view_surf = surface_create(global.CameraWidth + 1, global.CameraHeight + 1);
		}

		view_surface_id[0] = view_surf;
		*/
	
#endregion
//----------------------------------------------------------------------------------

