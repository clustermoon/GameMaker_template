/// @description

var data = ds_map_create();
ds_map_add(data, "x", mouse_x);
ds_map_add(data, "y", mouse_y);
ds_map_add(data, "id", id);
var dataJson = json_encode(data);
ds_map_destroy(data);

var buffer = buffer_create(100, buffer_wrap, 100);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_text, dataJson);
network_send_udp_raw(global.NetworkSocket, global.NetworkIp, global.NetworkPort, buffer, buffer_tell(buffer));
buffer_delete(buffer);
