/// @description Initialization
event_inherited(); 
/// @description Initialize entity parent

	//------------------------------------------------|
	jspd = 4;
	jumpCountMax = 2;
	acl = 0.05;
	groundFric = acl;
	airFric = acl/2;
	jumpCount = jumpCountMax;
	prevHsp = entity_hspd;
	//------------------------------------------------


	dashCountMax = 1;
	canWallJump = true;
	dashSpd = 5;
	wJ_height = 4.5;
	wJ_distance = 2;
	cyoteTimerMax = 0.15;
	dashTimerMax = 1.5;
	dashCount = dashCountMax;
	cyoteTimer = cyoteTimerMax;
	dashTimer = dashTimerMax;
	cyoteTimer_enable = false;
	dashTimer_enable = false;


