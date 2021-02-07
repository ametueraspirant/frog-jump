/// @description Init Menus

// which menu page is the player on
m_state = "main"; // this will be set to the string main, options, and stats, to determine where the menu is.
#macro _menu_state obj_game_controller.m_state

enum element_type {
	run_script,
	page_transition,
	slider,
	toggle
}
	
global.settings = {
	vol: {
		master: 100,
		audio: 100,
		music: 100
	},
	lang: {
		eng: true,
	},
	notif: false,
	tutorial: true
};

global.menu = {
	
	
	arr: [
		
	]
};
