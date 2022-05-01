/// @description Insert description here

//- Entity Variables
entity_collision = oCollision;

entity_spd = 0;
entity_dir = 0;
entity_collision_drag = 2;
entity_maxSpd = 4;
entity_termVel = 10;
entity_acl = 0.05;
entity_fric = entity_acl*2;

entity_hspd = 0;
entity_vspd = 0;
entity_gravity = Grav;

//- Entity 
// -Controller Top-Down 
function entity_tdControler_collisions(spd, dir){
	var xtarg = x+lengthdir_x(spd,dir);
	var ytarg = y+lengthdir_y(spd,dir);
 
	if place_free(xtarg,ytarg) {
	    x = xtarg;
	    y = ytarg;
	}else {
	    var sweep_interval = 10;
		spd = entity_collision_drag;
	    for ( var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
	        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
	            var angle_to_check = dir+angle*multiplier;
	            xtarg = x+lengthdir_x(spd, angle_to_check);
	            ytarg = y+lengthdir_y(spd, angle_to_check);     
	            if place_free(xtarg,ytarg) {
	                x = xtarg;
	                y = ytarg;  
	                exit;       
	            }   
	        }
	    }
	}
}
function entity_tdControler_set_speed(spd, max_spd, fric){
	return lerp(spd, max_spd, fric)*DeltaMultiplyer;
}	
function entity_tdControler_set_direction(moving ,h_keys, v_keys){
	
	static _prev_hKey = 0;
	static _prev_vKey = 0;
	if(h_keys != 0){ _prev_hKey = h_keys; }
	if(v_keys != 0){ _prev_vKey = v_keys; }
	
	var _return;
	if(moving){ 
		_return = point_direction(0, 0, h_keys, v_keys); 	
	}else{
		_return = point_direction(0, 0, _prev_hKey, _prev_vKey); 	
	}
	return _return;
}	
// -Controller Side-Scroller 	
function entity_ssControler_collisions(collision){
			var s_top = (instance_place(x, y-sprite_height-1, collision) && instance_place(x, y+1, collision));
			var s_side = instance_place(x+(sprite_width/2)+1, y, collision) && instance_place(x-(sprite_width/2)-1, y, collision);
		
			//Get unstuck from walls	
			if(!s_side || !s_top){
				if(place_meeting(x, y, collision)){	
					for(var i = 0; i < 1000; i++){
						//Right
						if(!instance_place(x + i, y, collision)){
							x += i;
							break;
						}
						//Left
						if(!place_meeting(x - i, y, collision)){
							x -= i;
							break;
						}
						//Up
						if(!place_meeting(x, y - i, collision)){
							y -= i;
							break;
						}
						//Down
						if(!place_meeting(x, y + i, collision)){
							y += i;
							break;
						}
					}
				}
			}
		  if(place_meeting(x + entity_hspd, y, collision)){
		     if(!place_meeting(x+sign(entity_hspd), y, collision)){
		            entity_hspd += sign(entity_hspd); 
		        }
		            entity_hspd = 0;
		    }
			x += entity_hspd;
		    if(place_meeting(x, y + entity_vspd, collision)){
		        if(!place_meeting(x, y+sign(entity_vspd), collision)){
		            entity_vspd += sign(entity_vspd); 
		        }
		            entity_vspd = 0;
		    }
			y += entity_vspd;
		}



		
