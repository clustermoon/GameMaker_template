/// @description 
var type = async_load[? "type"];

switch(type){
	case network_type_connect:
		var soc = async_load[? "socket"];
		ds_list_add(clients, soc);
	break;
	
	case network_type_disconnect:
		var soc = async_load[? "socket"];
		ds_list_delete(clients, ds_list_find_index(clients, soc))
	break;
	
	case network_type_data:
		server_data();
	break;
}

