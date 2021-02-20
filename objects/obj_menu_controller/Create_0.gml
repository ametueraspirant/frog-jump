/// @description Init Menus

// which menu page is the player on
m_state = "main"; // this will be set to the string main, options, and stats, to determine where the menu is.
#macro _menu_state obj_game_controller.m_state

enum element_type {
	run_script,
	page_transition,
	slider,
	toggle,
	array
}
	
global.settings = {
	vol: {
		master: 100,
		audio: 100,
		music: 100
	},
	lang: "english",
	notif: false,
	tutorial: true
};

// button structure: ["button_name_str", button_x, button_y, is_selected, element_type, element_function]
menu = {
	stat: {mx: 50, my: 100, curr_menu: "main"},
	main: [
		["play", 50, 50, false, element_type.page_transition, "maps"],
		["options", 50, 100, false, element_type.page_transition, "options"],
		["exit", 50, 150, false, element_type.run_script, game_end]
	],
	options: [
		["music", 0, 0, false, element_type.slider, 100],
		["sounds", 0, 0, false, element_type.slider, 100],
		["language", 0, 0, false, element_type.array, ["english"]],
		["notifications", 0, 0, false, element_type.toggle, false],
		["back", 0, 0, false, element_type.page_transition, "main"]
	],
	ingame: [
		["music", 0, 0, false, element_type.slider, 100, false],
		["sounds", 0, 0, false, element_type.slider, 100, false],
		["language", 0, 0, false, element_type.array, ["english"]],
		["notifications", 0, 0, false, element_type.toggle, false],
		["resume", 0, 0, false, element_type.run_script, resume_game],
		["exit", 0, 0, false, element_type.run_script, exit_game]
	],
	maps: [
		["forest", 0, 0, false, element_type.run_script, start_game],
		["dunes", 0, 0, false, element_type.run_script, start_game],
		["mountains", 0, 0, false, element_type.run_script, start_game],
		["city", 0, 0, false, element_type.run_script, start_game],
		["space", 0, 0, false, element_type.run_script, start_game],
		["underwater", 0, 0, false, element_type.run_script, start_game]
	]
};
