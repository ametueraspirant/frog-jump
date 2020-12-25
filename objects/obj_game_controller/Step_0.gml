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
		// on mouse click, save first position.
		if(m_down) {
			state.msavx = mouse_x;
			state.msavy = mouse_y;
		}

		// on mouse held, show the jump arc prediction line.
		if(m_held) {
			line.len = point_distance(state.msavx, state.msavy, mouse_x, mouse_y); 
			line.ang = point_direction(state.msavx, state.msavy, mouse_x, mouse_y);
			state.himp = (min(max_length, line.len) * dcos(line.ang)) / (max_length / 20);
			state.vimp = (min(max_length, line.len) * dsin(line.ang)) / (max_length / 20);
		}

		// on mouse up
		if(m_up) {
			// if vertical impulse is not too weak and not upwards.
			if(state.vimp <= -3 && obj_frog.state.str == "idle") {
				obj_frog.state.hsp = calc_impulse(state.himp, 0.1);
				obj_frog.state.vsp = calc_impulse(state.vimp, 1);
				obj_collider_parent.state.vsp = calc_impulse(state.vimp, 0.9);
			}
		}
		
		// if the frog is landed and also too high.
		if(obj_frog.state.str == "idle" && obj_frog.y <= 1500) {
			obj_frog.y = lerp(obj_frog.y, 1500, 0.5); // move frog.
			obj_collider_parent.y = lerp(obj_frog.y, 1500, 0.5); // will this work? I don't know.
		}
	break;
	case "stats":
	
	break;
	default:
	show_debug_message("something went wrong with the game state controller");
	break;
}
