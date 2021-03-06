/// @description Init Game

// main macros for controls
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_held mouse_check_button(mb_left)
#macro m_up mouse_check_button_released(mb_left)
#macro t_down device_mouse_check_button_pressed(0, mb_left)
#macro t_held device_mouse_check_button(0, mb_left)
#macro t_up device_mouse_check_button_released(0, mb_left)

// layer macros
#macro _main_layer "Instances"
#macro _player_layer "Player"

// main game states
g_state = "menu"; // this will be set to the string intro, menu, prep, go, death, and scores, and called by other objects.
b_state = "null"; // this will be called when rendering menu buttons probably.

// turned into macros for easy global access
#macro _game_state obj_game_controller.g_state
#macro _button_state obj_game_controller.b_state

//Spawn Behavior Variables // testing variables clean up later if I can remember.
height = 0;
amount = 375;
behavior = 0;
next_height = 0

//Enemy Behavior Variables
snake_chance = 1
snake_chance_incre = 1
monkey_chance = 1
monkey_chance_incre = 1
spawn_monkey = true
bird_chance = 1
bird_chance_incre = 1

instance_create_layer(0, 0, _main_layer, obj_game_camera);

debug_on = 0; // delete on release, debug mode.
