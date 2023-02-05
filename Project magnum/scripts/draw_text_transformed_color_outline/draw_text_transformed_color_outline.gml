function draw_text_transformed_color_outline(xx, yy, txt, size, angle, color, alpha){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var new_color = c_black;
	var s = size;
	draw_set_font(name_font);

	draw_text_transformed_color(xx+1, yy+1, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx-1, yy-1, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx, yy+1, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx+1, yy, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx, yy-1, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx-1, yy, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx-1, yy+1, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);
	draw_text_transformed_color(xx+1, yy-1, txt, sGameMode_menuBg, sGameMode_menuBg, angle, new_color, new_color, new_color, new_color, alpha);

	draw_text_transformed_color(xx, yy, txt, size, size, angle, color, color, color, color, alpha);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}