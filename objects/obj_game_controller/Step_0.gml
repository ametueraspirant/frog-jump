/// @description Run Game
#macro _ground_width sprite_get_width(spr_ground) //change these out with sprite
#macro _ground_height sprite_get_height(spr_ground)

switch(_game_state) {
	case "menu":
	if(!instance_exists(obj_menu_controller))instance_create_layer(0, 0, _main_layer, obj_menu_controller);
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
		instance_create_layer(room_width/2, room_height - _ground_height, _player_layer, obj_frog);  
        for(i = 200; i < room_height; i += room_height/4){
            spawn_platforms(i,i-300);
        }
    }
	_game_state = "go";
	break;
	
	case "go":
        if(height >= next_height){
            next_height += amount;
            spawn_platforms(-20, -amount);        
            check_snake_spawn();
        }

	break;
	case "stats":
	
	break;
	default:
	show_debug_message("something went wrong with the game state controller");
	break;
}