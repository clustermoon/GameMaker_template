/// @description Controller
if(!Pause){
	entity_hspd = clamp(entity_hspd, -entity_maxSpd, entity_maxSpd);
	entity_vspd = clamp(entity_vspd, -entity_termVel, entity_termVel);
	entity_ssControler_collisions(entity_collision);
}

//---- Animate ----- //

