/// @description Move Frog

state = increment_fractions(state);
		
if(get_id() != noone)state.platid = get_id();

if(state.hsp > 0)state.dir = 1;
if(state.hsp < 0)state.dir = -1;

if(state.hsp <= 1)state.hsp = 0;
else state.hsp -= state.fric * state.dir;

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
	if(state.vimp <= -3 && (state.str == "windup")) {
		state.hsp = state.himp
		state.vsp = state.vimp
	}
}

// if the frog is landed and also too high.
if(state.str == "idle" && y <= 1500) {
	y = lerp(y, 1500, 0.1); // move frog.
	obj_collider_parent.y = lerp(y, 1500, 0.1); // and platform.
}

if(!place_meeting(x, y + state.vsp, obj_collider_parent)){
	y += state.vsp;
	if(state.vsp <= base.grav.spd){
		state.vsp += state.grav;
	}
} else {
	if(!place_meeting(x, y + 1, obj_collider_parent)) {
		y += state.vsp;
	}
	state.vsp = 0;
	state.vspf = 0;
}

/*if(!place_meeting(x, y + state.vsp, obj_collider_parent)){
	y += state.vsp;
	if(state.vsp <= base.grav.spd){
		state.hsp -= state.fric;
	}
} else {
	if(!place_meeting(x, y + 1, obj_collider_parent)) {
		x += state.hsp;
	}
	state.hsp = 0;
	state.hspf = 0;
}*/

switch(state.str) {
	case "rising":
	#region // rising
    image_index = 2
	state.grav = base.grav.rise;
	state.fric = base.fric.air;
	if(state.vsp > 0) { // if go down, falling.
		state.str = "falling";
		break;
	}
	#endregion
	break;
	case "falling":
	#region // falling
    image_index = 3
	state.grav = base.grav.fall;
	state.fric = base.fric.air;
	if(state.vsp < 0) { // if go up, rising.
		state.str = "rising";
		break;
	}
	if(place_meeting(x, y + 1, obj_collider_parent)) { // if hit ground, idle.
		state.str = "idle";
		break;
	}
	#endregion
	break;
	case "idle":
	#region // idle
    image_index = 0
	state.fric = base.fric.plat;
	if(m_down) { // if click, windup.
		state.str = "windup";
		break;
	}
	// add falling logic here
	#endregion
	break;
	case "windup":
	#region // windup
	image_index = 1;
	if(m_up && state.vsp < 0) {
		state.str = "rising"; // if go up, rising.
		break;
	}
	if(m_up) {
		state.str = "idle"; // if let go, idle.
		break;
	}
	// and here that doesn't conflict with camera zoom.
	#endregion
	break;
	default:
	#region // default
	
	#endregion
	break;
}

