/// @description Run Game

switch(_game_state) {
	case "menu":
	if(!instance_exists(obj_ground)) {
		instance_create_layer(0, 0, _main_layer, obj_ground);
	}
	break;
	case "prep":
	if(!instance_exists(obj_frog)) {
		//instance_create_layer()
	}
	break;
	
	case "go":
	
	break;
	case "stats":
	
	break;
	default:
	show_debug_message("something went wrong with the game state controller");
	break;
}
