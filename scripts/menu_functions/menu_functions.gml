/// @arg direction
/// @arg new_menu
function menu_transition(_dir, _new) {
	
}

function start_game() {
	_menu_state = "closed";
	menu_transition("right");
	_game_state = "prep";
}

function resume_game() {
	
}

function exit_game() {
	
}

function run_script(_scr) {
	_scr();
}

function draw_menu() {
	
}