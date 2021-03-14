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

// button structure: TBD
menu = {
	stat: {mx: 50, my: 100, curr_menu: []},
	draw: function() {
		var _c_menu = stat.curr_menu; // short for current menu, duh obviously...
		var _x = stat.mx; // menu start x
		var _y = stat.my; // menu start y
		if(array_length(_c_menu) > 0) {
			for(var butt = 0; butt < array_length(_c_menu); butt++) {
				var _ton = _c_menu[butt]; // current button
				var _w = sprite_get_width(_ton[1]); // width of the current sprite
				var _h = sprite_get_height(_ton[1]); // height of the current sprite
				draw_sprite_stretched(_ton[1], 0, _ton[2] + _x, _ton[3] + _y,  _w * 4, _h);
				draw_text(_ton[2] + _w/3 +_x, _ton[3] + _h/3 + _y, _ton[0]);
			}
		}
	},
	step: function() {
		// check os type and set proper variables
		if(os_type == os_android || os_type == os_ios) {
			var i_down = m_down;
			var i_held = m_held;
			var i_up = m_up;
		} else {
			var i_down = t_down;
			var i_held = t_held;
			var i_up = t_up;
		};
		var _c_menu = stat.curr_menu; // current menu
		var _x = stat.mx; // menu start x
		var _y = stat.my; // menu start y
		if(array_length(_c_menu) > 0) {
			for(var clic = 0; clic < array_length; clic++) {
				var _k = _c_menu[clic]; // current button
				var _w = sprite_get_width(_ton[1]); // width of the current sprite
				var _h = sprite_get_height(_ton[1]); // height of the current sprite
				if(point_in_rectangle(device_mouse_x(0), device_mouse_y(0), _x + _k[2], _y + _k[3], _x + _k[2] + _w, _x + _k[3] + _h)) {
					_k[4] = true;
				} else {
					_k[4] = false;
				}
				if(i_up && _k[4]) {
					
				}
			};
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
