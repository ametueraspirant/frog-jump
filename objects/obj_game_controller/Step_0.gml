/// @description Run Game
#macro _ground_width sprite_get_width(spr_ground_test) //change these out with sprite
#macro _ground_height sprite_get_height(spr_ground_test)

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
		for(var prep = 0; prep < room_width / _ground_width; prep++) {
			instance_create_layer(
			0 + (prep * _ground_width),
			room_height - _ground_height,
			_main_layer,
			obj_ground
			)
		}
		instance_create_layer(room_width/2, room_height - _ground_height * 2, _main_layer, obj_frog);
	}
	_game_state = "go";
	break;
	
	case "go":
	
	break;
	case "stats":
	
	break;
	default:
	show_debug_message("something went wrong with the game state controller");
	break;
}
