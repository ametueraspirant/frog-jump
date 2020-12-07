/// @description Init Game

// the big macros
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_up mouse_check_button_released(mb_left)
#macro _main_layer "Instances"
#macro _game_state obj_game_controller.g_state //useage. _game_state = "string"; if(_game_state = "string");

g_state = "menu" // this will be set to the string menu, prep, go, and scores, and called by other objects.
m_state = "main" // this will be set to the string main, options, and stats, to determine where the menu is.
instance_create_layer(0, 0, _main_layer, obj_game_camera);

// contain the set of x + y coordinates and objects to spawn at each coordinate to be called with the menu_render function.
// likely better as a multidimensional array as it will also need to contain what each button does and what text to put on it.
menu_arrays = {
	main: [
		/* ex:
		[50, 50, obj_options, "options"],
		[200, 560, obj_button_play, "Start!"]
		*/
	],
	options: [],
	stats: []
};