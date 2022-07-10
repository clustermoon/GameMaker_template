#region	
	function instance_place_area(xx, yy, obj, v_padding, h_padding){
			var _right	= instance_place(xx+h_padding, yy, obj);
			var _left   = instance_place(xx-h_padding, yy, obj);
			var _down	= instance_place(xx, yy+v_padding, obj);
			var _up		= instance_place(xx, yy-v_padding, obj);
	
			if(_right){
				return _right;
			}else if(_left){
				return _left;	
			}else if(_down){
				return _down;
			}else if(_up){
				return _up;
			}else { return false; }
		}
#endregion