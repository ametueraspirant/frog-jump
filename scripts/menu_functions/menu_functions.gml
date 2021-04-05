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

function exit_game(scr) {
	_scr();
}
