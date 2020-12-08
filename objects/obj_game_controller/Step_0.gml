/// @description Run Game

switch(_game_state) {
	case "menu":
	switch(_menu_state) {
		case "main":
		
		break;
		default:
		show_debug_message("sorry that's not a menu I can find");
		break;
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
