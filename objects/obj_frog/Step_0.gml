/// @description Move Frog

switch(state.str) {
	case "rising":
	
	break;
	case "falling":
	
	break;
	case "idle":
	
	break;
	default:
	
	break;
}

move_frog(state, base);


/*
if(place_meeting(x, y + 1, obj_collider_parent)) {
	state.str = "idle";
} else {
	if(state.vsp <= 0) {
		state.str = "rising";
	} else {
		state.str = "falling";
	}
}

//Jumping
if place_meeting(x,y+1,obj_collider_parent) and keyboard_check_pressed(vk_space)
    {
    vsp += -(y-mouse_y)/15
    with(obj_game_controller)
        {
        move_platforms(100)
        }
}

//vertical collision
if place_meeting(x,y+abs(vsp),obj_collider_parent) and vsp > 0
    {
    while(!place_meeting(x,y+sign(vsp),obj_collider_parent)) and vsp > 0
        {
        y += sign(vsp)
        }    
    vsp = 0
    }
y += vsp

