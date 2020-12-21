/// @description Move Frog

// on mouse click, save first position.
if(m_down) {
	state.mx = mouse_x;
	state.my = mouse_y;
}

// on mouse held, show the jump arc prediction line.
if(m_held) {
	line.l = point_distance(state.mx, state.my, mouse_x, mouse_y); 
	line.a = point_direction(state.mx, state.my, mouse_x, mouse_y);
	state.hi = (min(max_length, line.l) * dcos(line.a)) / (max_length / 20);
	state.vi = (min(max_length, line.l) * dsin(line.a)) / (max_length / 20);
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

// move frog
y += state.vs;
x += state.hs;

/*

if(place_meeting(x, y + 1, obj_collider_parent)) {
	state.str = "idle";
} else {
	if(state.vs <= 0) {
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

