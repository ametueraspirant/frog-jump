/// @description Init Menus

enum e_type {
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

menu = {
	stat: {mx: 50, my: 100, curr_menu: []},
	draw: function() {
		var _c_menu = stat.curr_menu; // short for current menu, duh obviously...
		var _x = stat.mx; // menu start x
		var _y = stat.my; // menu start y
		if(array_length(_c_menu) > 0) {
			for(var int = 0; int < array_length(_c_menu); int++) {
				var _obj = _c_menu[int]; // current button
				if(!_obj.selected) {
					var _sprite = _obj.spr.def;
				} else if(!_obj.pressed) {
					var _sprite = _obj.spr.hover;
				} else {
					var _sprite = _obj.spr.down;
				}
				var _w = sprite_get_width(_sprite); // width of the current sprite
				var _h = sprite_get_height(_sprite); // height of the current sprite
				draw_sprite_stretched(_sprite, 0, _obj._x + _x, _obj._y + _y,  _w * 4, _h);
				draw_text(_obj[2] + _w/3 +_x, _obj[3] + _h/3 + _y, _obj._name);
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
			for(var int = 0; int < array_length(_c_menu); int++) {
				var _obj = _c_menu[int]; // current button
				if(!_obj.selected) {
					var _sprite = _obj.spr.def;
				} else if(!_obj.pressed) {
					var _sprite = _obj.spr.hover;
				} else {
					var _sprite = _obj.spr.down;
				}
				var _w = sprite_get_width(_sprite); // width of the current sprite
				var _h = sprite_get_height(_sprite); // height of the current sprite
				if(point_in_rectangle(device_mouse_x(0), device_mouse_y(0), _x + _obj._x, _y + _obj._y, _x + _obj._x + _w, _x + _obj._y + _h)) {
					_obj.selected = true;
				} else {
					_obj.selected = false;
				}
				if(_obj.selected) {
					if(i_down) {
						_obj.pressed = true;
					}
					if(i_up) {
						_obj.pressed = false;
						switch(_obj.element) {
							
							default:
							break;
						}
					}
				}
			};
		};
	},
	main: [
		{ // play button
			_name: "play",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 50,
			selected: false,
			pressed: false,
			element: e_type.page_transition,
			destination: "maps"
		},
		{ // options button
			_name: "options",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 100,
			selected: false,
			pressed: false,
			element: e_type.page_transition,
			destination: "options"
		},
		{ // exit button
			_name: "exit",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 150,
			selected: false,
			pressed: false,
			element: e_type.run_script,
			scr: game_end
		},
	],
	options: [
		{ // music slider
			_name: "music",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 50,
			selected: false,
			pressed: false,
			element: e_type.slider,
			maximum: 100
		},
		{ // sounds slider
			_name: "sounds",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 100,
			selected: false,
			pressed: false,
			element: e_type.slider,
			maximum: 100
		},
		{ // language array
			_name: "language",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 150,
			selected: false,
			pressed: false,
			element: e_type.array,
			array: ["english"]
		},
		{ // notifications toggle
			_name: "notifications",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 200,
			selected: false,
			pressed: false,
			element: e_type.toggle,
			status: false
		},
		{ // back button
			_name: "back",
			spr: { def: spr_button_sho_bro_test hover: spr_button_sho_bro_test, down: "placeholder" },
			_x: 50,
			_y: 250,
			selected: false,
			pressed: false,
			element: e_type.page_transition,
			destination: "main"
		}
	],
	ingame: [
		["music", 0, 0, false, e_type.slider, 100, false],
		["sounds", 0, 0, false, e_type.slider, 100, false],
		["language", 0, 0, false, e_type.array, ["english"]],
		["notifications", 0, 0, false, e_type.toggle, false],
		["resume", 0, 0, false, e_type.run_script, resume_game],
		["exit", 0, 0, false, e_type.run_script, exit_game]
	],
	maps: [
		["forest", 0, 0, false, e_type.run_script, start_game],
		["dunes", 0, 0, false, e_type.run_script, start_game],
		["mountains", 0, 0, false, e_type.run_script, start_game],
		["city", 0, 0, false, e_type.run_script, start_game],
		["space", 0, 0, false, e_type.run_script, start_game],
		["underwater", 0, 0, false, e_type.run_script, start_game]
	]
};
menu.stat.curr_menu = menu.main;
