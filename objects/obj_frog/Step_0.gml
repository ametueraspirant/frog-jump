/// @description Move Frog

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

// on mouse up, jump frog.
if(m_up && (state.str == "idle" || state.str == "vine")) {
	// ??? uh maybe something will go here.
	
	jump(state);
}

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

