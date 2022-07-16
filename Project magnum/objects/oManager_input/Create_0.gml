/// @description 

//Cursor
global.GameCursor = noone;
window_set_cursor(cr_none);

enum eInputList {
	a,
	d,
	s,
	w,
	aBtn,
	bBtn,
	xBtn,
	yBtn,
	rBmp,
	rTrg,
	lBmp,
	lTrg,
	select	
}
global.InputList_keyboard = [
	ord("A"),
	ord("D"),
	ord("S"),
	ord("W"),
	vk_space,
	vk_shift,
	ord("Z"),
	ord("X"),
	ord("1"),
	ord("2"),
	ord("3"),
	ord("4"),
	ord("E")
];

global.InputList_controller = [
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
];


