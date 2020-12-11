/// @description Init Game

// the big macros
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_held mouse_check_button(mb_left)
#macro m_up mouse_check_button_released(mb_left)
#macro _main_layer "Instances"

// main game states
g_state = "menu"; // this will be set to the string menu, prep, go, and scores, and called by other objects.
m_state = "main"; // this will be set to the string main, options, and stats, to determine where the menu is.
b_state = "null";

//Spawn Behavior Variables
height = 0
amount = 50
behavior = 0
next_height = height + amount

// turned into macros for easy global access
#macro _game_state obj_game_controller.g_state
#macro _menu_state obj_game_controller.m_state
#macro _button_state obj_game_controller.b_state

// contain the set of x + y coordinates and objects to spawn at each coordinate to be called with the menu_render function.
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

instance_create_layer(0, 0, _main_layer, obj_game_camera);
