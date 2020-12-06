/// @description Init Game

// the big macros
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_up mouse_check_button_released(mb_left)
#macro _main_layer "Instances"
#macro _game_state = obj_game_controller.g_state

g_state = "menu" //this will be set to the string menu, prep, go, and scores, and called by other objects.

instance_create_layer(0, 0, _main_layer, obj_game_camera);
