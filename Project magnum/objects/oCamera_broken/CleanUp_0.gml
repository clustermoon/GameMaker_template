/// @description Insert description here
// You can write your code in this editor
if (surface_exists(view_surf)) {
    surface_free(view_surf);
    view_surf = -1;
}
camera_destroy(view_camera[0]);



