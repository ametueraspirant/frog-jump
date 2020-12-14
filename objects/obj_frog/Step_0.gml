/// @description Move Frog

// on mouse click, save first position.
if(m_down) {
	state.mx = mouse_x;
	state.my = mouse_y;
}

// on mouse held, show the jump arc prediction line.
if(m_held) {
	// calculate and draw jump prediction line.
}

// on mouse up, jump frog.
if(m_up && state.str = "idle") {
	state.hi = max(-max_length, min(max_length, lengthdir_x(state.mx - mouse_x, image_angle))) / (max_length * 0.01);
	state.vi = min(max_length, lengthdir_y(state.my - mouse_y, image_angle+90)) / (max_length * 0.01);
	//jump(state);
}
//(max_length/(max_length*0.1))

// control frog state
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

