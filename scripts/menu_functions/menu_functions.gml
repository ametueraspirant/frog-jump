/// @arg direction
/// @arg new_menu
function menu_transition(_dir, _new) {
	
	_menu_state = _new;
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
	for(var butt = 0; butt < _menu.length; butt++) {
		var cenu = _menu[butt]; // short for current menu obviously
		draw_sprite_stretched(cenu[], cenu[].image_index, cenu[], cenu[], cenu[], cenu[]);
	}
}