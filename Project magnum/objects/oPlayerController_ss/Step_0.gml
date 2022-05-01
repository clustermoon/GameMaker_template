/// @description Controller
//Calling Input Array | Input_Move & Input_Action |
#region | updating variables
	//Speed variables
	var _acl = acl*DeltaMultiplyer;
	var _groundFric = groundFric*DeltaMultiplyer;
	var _wallFric = (groundFric*2.5)*DeltaMultiplyer;
	var _airFric = airFric*DeltaMultiplyer;
	var _dashFric = (airFric/2)*DeltaMultiplyer;
	var _grav = entity_gravity*DeltaMultiplyer; 
	//Reassignments
	var _noInput = Input_Move[12];
	var _col = oCollision;
	//Collision detections
	var _onWall_right = place_meeting(x+1, y, _col);
	var _onWall_left = place_meeting(x-1, y, _col);
	var nearWall = place_meeting(x-sprite_width/3, y, _col) || place_meeting(x+(sprite_width/3)-1, y, _col);
	var _grounded = instance_place(x, y+1, _col);
	//Movement Tracking 
	if(entity_hspd > 0){ prevHsp = 1; }
	if(entity_hspd < 0){ prevHsp = -1; }   
#endregion	
#region | Movement
	//accelerate
	
	if(!_noInput && (!_onWall_right || !_onWall_left)){
		entity_hspd += Input_Move[0]*_acl;
	}

	//Wall check
	if((_onWall_left || _onWall_right)){
		if(canWallJump){
			jumpCount = jumpCountMax;
			dashCount = dashCountMax;
		}
		entity_vspd = entity_vspd*0.9;
	}
		
	var isDashing = false;
	if(dashCount <= 0){ isDashing = true; }
		
	//Movement	
	if(_grounded){
		if(!isDashing){
			if(_noInput){ entity_hspd = lerp(entity_hspd, 0, _groundFric); }
		}else{ if(_noInput){ entity_hspd = lerp(entity_hspd, 0, _dashFric); } }
		jumpCount = jumpCountMax;
		dashCount = dashCountMax; 
		
	}else{
		if(entity_vspd > 0 && !nearWall){ cyoteTimer_enable = true; 
		}else if(entity_vspd > 0){ cyoteTimer_enable = true; }	
			
		if(canWallJump){
			if(!nearWall){
				if(!isDashing){
					if(_noInput){ entity_hspd = lerp(entity_hspd, 0, _airFric); }
				}else{ if(_noInput){ entity_hspd = lerp(entity_hspd, 0, _dashFric); } }
			}else{ entity_hspd = lerp(entity_hspd, 0, _wallFric); }
		}else{ 
			if(!isDashing){
				if(_noInput){entity_hspd = lerp(entity_hspd, 0, _groundFric);}
			}else{ if(_noInput){entity_hspd = lerp(entity_hspd, 0, _dashFric);} }
	
		}
		//Apply _gravity;
		entity_vspd += _grav;
	}
	
#endregion
#region | Jump and _gravity
	//Jump
	var wallJump_height = wJ_height*DeltaMultiplyer;
	var wallJump_distance = wJ_distance*DeltaMultiplyer;
	if(jumpCount > 0){
	    if(Input_Action[0]){
	        entity_vspd -= jspd;
	        jumpCount -= 1;
			
	        if(canWallJump){    
	            if(!_grounded && (_onWall_left || _onWall_right)){
	                entity_vspd = -wallJump_height;
	                if(_onWall_left){
	                    switch(Input_Move[0]){
	                        case 1:
	                            entity_hspd = prevHsp*wallJump_distance;
	                        break;
	                        case -1:
	                            entity_hspd = -prevHsp*wallJump_distance;
	                        break;
	                        default:
	                            entity_hspd = -prevHsp*wallJump_distance;
	                        break;
	                    }   
	                }else if(_onWall_right){
	                    switch(Input_Move[0]){
	                        case 1:
	                            entity_hspd = -prevHsp*wallJump_distance;
	                        break;
	                        case -1:
	                            entity_hspd = prevHsp*wallJump_distance;
	                        break;
	                        default:
	                            entity_hspd = -prevHsp*wallJump_distance;
	                        break;
	                    }
	                }
	            }
	        }       
	    }
	}
	if(entity_vspd < 0 && !Input_Action[1]){ entity_vspd = 0; entity_vspd = max(entity_vspd, -_grav); }
#endregion			
#region | Dash
	//Dash
	var _dashAmnt = dashSpd*DeltaMultiplyer;
	var _dashDir;
	if(Input_Move[0] == 0){
	    _dashDir = prevHsp;
	}else{
	    _dashDir = Input_Move[0];
	}
	if(!_grounded){
		if(dashCount > 0 && !dashTimer_enable){
		    if(Input_Action[3]){
		        entity_hspd = _dashAmnt*_dashDir;
		        dashCount -= 1;
		        dashTimer_enable = true;
		    }
		}	    
	}
	if(dashTimer_enable){
	    if(dashTimer > dashTimerMax*0.8){
	        entity_vspd = entity_vspd/2;      
	    }
	}
#endregion
#region | Timers
	//dash Timer
	if(dashTimer_enable){
	    if(dashTimer > 0){
	        dashTimer -= DeltaReal;
			if(dashTimer > dashTimerMax*0.55){
				animationState = "dashing";
			}else{ animationState = "fall"; }
	    }else{
	        dashTimer = dashTimerMax;
			dashTimer_enable = false; 
	    }
	}

	//cyote Timer
	if(cyoteTimer_enable){
	    if(cyoteTimer > 0){
	        cyoteTimer -= DeltaReal;
	    }else{
	        cyoteTimer = cyoteTimerMax;
	        if(jumpCount >= jumpCountMax){ jumpCount -= 1; }
	        cyoteTimer_enable = false;  
	    }
	}
#endregion	

