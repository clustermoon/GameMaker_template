/// @function                 get_input(input);
/// @param {int} gi_		Type of control scheme 
/// @description			Reads input
function get_input(Input){
	var temp_move, temp_action;
	temp_move = array_create(13); //[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	temp_action = array_create(15); //[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	
	switch(Input){
		case "Controller":
			temp_move[0] = gamepad_axis_value(GamePad, Input_Type_Controller[0]);
			temp_move[1] = gamepad_axis_value(GamePad, Input_Type_Controller[1]);
			temp_move[2] = gamepad_button_check_pressed(GamePad, gp_padr);
			temp_move[3] = gamepad_button_check_pressed(GamePad,gp_padl);
			temp_move[4] = gamepad_button_check_pressed(GamePad,gp_padu);
			temp_move[5] = gamepad_button_check_pressed(GamePad,gp_padd);
			temp_move[6] = gamepad_axis_value(GamePad, Input_Type_Controller[2]);
			temp_move[7] = gamepad_axis_value(GamePad, Input_Type_Controller[3]);
			temp_move[8] = 0;
			temp_move[9] = 0;
			temp_move[10] = 0;
			temp_move[11] = 0;
			temp_move[12] = logic_xor(temp_move[0], temp_move[1]);
			
			temp_action[0] = gamepad_button_check_pressed(GamePad, Input_Type_Controller[4]); //Cross and A
			temp_action[1] = gamepad_button_check(GamePad, Input_Type_Controller[4]); //Held Cross and A
			temp_action[2] = gamepad_button_check_released(GamePad, Input_Type_Controller[5]); //Circle and B
			temp_action[3] = gamepad_button_check(GamePad, Input_Type_Controller[5]); //Circle and B
			temp_action[4] = gamepad_button_check_pressed(GamePad, Input_Type_Controller[6]); //Square and x
			temp_action[5] = gamepad_button_check(GamePad, Input_Type_Controller[6]); //Square and x
			temp_action[6] = gamepad_button_check_pressed(GamePad, Input_Type_Controller[7]); //Triangle and y
			temp_action[7] = gamepad_button_check(GamePad, Input_Type_Controller[7]); //Triangle and y
			temp_action[8] = gamepad_button_check_pressed(GamePad, Input_Type_Controller[8]);	
			temp_action[9] = gamepad_button_check(GamePad, Input_Type_Controller[8]);	
			temp_action[10] = gamepad_button_check_pressed(GamePad, Input_Type_Controller[9]);	
			temp_action[11] = gamepad_button_check(GamePad, Input_Type_Controller[9]);
			
			temp_action[12] = gamepad_button_check_pressed(GamePad, gp_start);//start
			temp_action[13] = gamepad_button_check_pressed(GamePad, gp_select);//select	
		break;
		case "Keyboard":
			var _wasd_h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
			var _wasd_v = keyboard_check(ord("S")) - keyboard_check(ord("W"));
			var _arrow_h = keyboard_check(vk_right) - keyboard_check(vk_left);
			var _arrow_v = keyboard_check(vk_down) - keyboard_check(vk_up);
			// Arrows
			temp_move[0] = _arrow_h;
			temp_move[1] = _arrow_v;
			temp_move[2] = keyboard_check_pressed(vk_right);
			temp_move[3] = keyboard_check_pressed(vk_left);
			temp_move[4] = keyboard_check_pressed(vk_up);
			temp_move[5] = keyboard_check_pressed(vk_down);
			// WASD
			temp_move[6] = _wasd_h;
			temp_move[7] = _wasd_v;
			temp_move[8] = keyboard_check_pressed(ord("D"));
			temp_move[9] = keyboard_check_pressed(ord("A"));
			temp_move[10] = keyboard_check_pressed(ord("W"));
			temp_move[11] = keyboard_check_pressed(ord("S"));
			//NO INPUT
			temp_move[12] = logic_xor(temp_move[0], temp_move[1]);
			
			temp_action[0] = keyboard_check_pressed(vk_space);
			temp_action[1] = keyboard_check(vk_space);
			temp_action[2] = keyboard_check_released(vk_shift);
			temp_action[3] = keyboard_check(vk_shift);
			temp_action[4] = keyboard_check_pressed(ord("Z"));
			temp_action[5] = keyboard_check(ord("Z"));
			temp_action[6] = keyboard_check_pressed(ord("X"));	
			temp_action[7] = keyboard_check(ord("X"));;
			temp_action[8] = keyboard_check_pressed(ord("A"));
			temp_action[9] = keyboard_check(ord("A"));;
			temp_action[10] = keyboard_check_pressed(ord("S"));
			temp_action[11] = keyboard_check(ord("S"));
			
			temp_action[12] = keyboard_check_pressed(vk_escape);//start
			temp_action[13] = keyboard_check_pressed(ord("E"));//select
		break;
	}
	
	Input_Move = temp_move;
	Input_Action = temp_action;

}
