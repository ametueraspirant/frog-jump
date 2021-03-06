/// @description Init Menus

enum element_type {
	run_script,
	page_transition,
	slider,
	toggle,
	array
}
	
global.settings = {
	vol: {
		audio: 1,
		music: 1
	},
	lang: "english",
	notif: false,
	tutorial: true
};

// button structure: ["button_name_str", button_x, button_y, is_selected, element_type, element_function]
menu = {
	stat: {mx: 50, my: 100, curr_menu: []},
	draw: function() {
		var _cenu = stat.curr_menu; // short for current menu, duh obviously...
		var _x = stat.mx; // menu start x
		var _y = stat.my; // menu start y
		if(array_length(_cenu) > 0) {
			for(var butt = 0; butt < array_length(_cenu); butt++) {
				var _ton = _cenu[butt]; // current button
				var _w = sprite_get_width(_ton[1]); // width of the current sprite
				var _h = sprite_get_height(_ton[1]); // height of the current sprite
				draw_sprite_stretched(_ton[1], 0, _ton[2] + _x, _ton[3] + _y,  _w * 4, _h);
				draw_text(_ton[2] + _w/3 +_x, _ton[3] + _h/3 + _y, _ton[0]);
			}
		}
	},
	step: function() {
		if(collision_rectangle()) {
			
		};
		if(m_down) {
			
		};
	},
	main: [
		["play", spr_button_sho_bro_test, 50, 50, false, element_type.page_transition, "maps"],
		["options", spr_button_sho_bro_test, 50, 100, false, element_type.page_transition, "options"],
		["exit", spr_button_sho_bro_test, 50, 150, false, element_type.run_script, game_end]
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
