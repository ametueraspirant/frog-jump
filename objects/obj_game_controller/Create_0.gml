/// @description Init Game

// the big macros
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_held mouse_check_button(mb_left)
#macro m_up mouse_check_button_released(mb_left)
#macro _main_layer "Instances"

// main game states
g_state = "prep"; // this will be set to the string menu, prep, go, death, and scores, and called by other objects.
m_state = "main"; // this will be set to the string main, options, and stats, to determine where the menu is.
b_state = "null"; // this will be called when rendering menu buttons probably.

// turned into macros for easy global access
#macro _game_state obj_game_controller.g_state
#macro _menu_state obj_game_controller.m_state
#macro _button_state obj_game_controller.b_state

//Spawn Behavior Variables // testing variables clean up later if I can remember.
global.height = 0;
global.amount = 50;
global.behavior = 0;
global.next_height = global.height + global.amount
global.grav = {
	rise: 0.7,
	fall: 1
};
global.max_fall_speed = 10;

state = {
	msavx: 0, // mouse drag starting x position
	msavy: 0, // mouse drag starting y position
	himp: 0, // stored horizontal impulse
	vimp: 0, // stored vertical impulse
};

// saved line values
line = {
	len: 0,
	ang: 0
};

// line max length
max_length = 320;

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

debug_on = 0; // delete on release, debug mode.
