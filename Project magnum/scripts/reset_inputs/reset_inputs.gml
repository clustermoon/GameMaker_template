function reset_inputs(){
	var default_inputs = [[
		vk_left,	//ord("A"),
		vk_right,	//ord("D"),
		vk_down,	//ord("S"),
		vk_up,		//ord("W"),
		vk_space,
		vk_shift,
		ord("Z"),
		ord("X"),
		ord("1"),
		ord("2"),
		ord("3"),
		ord("4"),
		ord("E")
	], [
		gp_padl,
		gp_padr,
		gp_padd,
		gp_padu,
		gp_face1,
		gp_face2,
		gp_face3,
		gp_face4,
		gp_shoulderrb,
		gp_shoulderr,
		gp_shoulderlb,
		gp_shoulderl,
		gp_select
	]];
	
	
	global.InputList_keyboard	= default_inputs[0];
	global.InputList_controller = default_inputs[1];
}