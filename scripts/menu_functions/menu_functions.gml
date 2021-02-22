/// @arg direction
/// @arg new_menu
function menu_transition(_dir, _new) {
	
	menu.stat.curr_menu = _new;
}

function start_game() {
	menu_transition("right", "closed");
	_game_state = "prep";
}

function resume_game() {
	menu_transition("left", "closed");
	_game_state = "go";
}

function exit_game() {
	
}

function run_script(_scr) {
	_scr();
}

function draw_menu(_menu) {
	var _cenu = _menu.stat.curr_menu; // short for current menu, duh obviously...
	var _x = _menu.stat.mx; // menu start x
	var _y = _menu.stat.my; // menu start y
	if(array_length(_cenu) > 0) {
		for(var butt = 0; butt < array_length(_cenu); butt++) {
			var _ton = _cenu[butt]
			draw_sprite_stretched(_ton[1], 0, _ton[2] + _x, _ton[3] + _y, sprite_get_width(_ton[1]), sprite_get_width(_ton[1]));
			draw_text(_ton[2] + _x, _ton[3] + _y, _ton[0]);
		}
	}
}