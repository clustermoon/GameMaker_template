/// @description 
instance_destroy(oButton_text);
for(var i = 0; i < array_length(menu_options); i++){
	var option = menu_options[i];
	for(k = 0; k < array_length(option); k++){
		instance_destroy(option[k]);
		option[k] = noone;
	}
}