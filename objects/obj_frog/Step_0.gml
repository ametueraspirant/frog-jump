/// @description Move Frog

// check os type and set proper variables
if(os_type == os_android || os_type == os_ios) {
	var i_down = m_down;
	var i_held = m_held;
	var i_up = m_up;
} else {
	var i_down = t_down;
	var i_held = t_held;
	var i_up = t_up;
}

state = increment_fractions(state); // increment fractions code makes sure frog always moving at incremental speeds.
		
if(get_id() != noone)state.platid = get_id(); // checks every frame for a nearby platform in the jump path of the frog and gets the id.

// sets the frog's direction depending on speed.
if(state.hsp > 0)state.dir = 1;
if(state.hsp < 0)state.dir = -1;

// sets the frog speed to 0 if it's too low
if(abs(state.hsp) <= 1 && state.str == "idle")state.hsp = 0 && state.hspf = 0; // this a thing I can do?
else state.hsp -= state.fric * state.dir * abs(state.hsp/base.fric.spd);

// on mouse click, save first position.
if(i_down) {
	state.msavx = mouse_x;
	state.msavy = mouse_y;
}

// on mouse held, show the jump arc prediction line.
if(i_held) {
	line.len = point_distance(state.msavx, state.msavy, mouse_x, mouse_y); 
	line.ang = point_direction(state.msavx, state.msavy, mouse_x, mouse_y);
	state.himp = (min(max_length, line.len) * dcos(line.ang)) / (max_length / base.jumpstr);
	state.vimp = (min(max_length, line.len) * dsin(line.ang)) / (max_length / base.jumpstr);
}

// on mouse up
if(i_up) {
	// if vertical impulse is not too weak and not upwards.
	if(state.vimp <= -15 && (state.str == "windup")) {
		state.hsp = state.himp
		state.vsp = state.vimp
	}
}

y += state.vsp;
if(!place_meeting(x, y + 1, obj_collider_parent) || state.str == "rising" || state.str == "falling") {
	if(state.vsp <= base.grav.spd) {
		state.vsp += state.grav;
	}
} else {
	if(state.vsp > 0 && bbox_bottom < state.platid.bbox_top) {
		while(!place_meeting(x, y + sign(state.vsp), obj_collider_parent)) {
			y += sign(state.vsp);
		}
		state.vsp = 0;
		state.vspf = 0;
	}
}

x -= state.hsp;
if(x < 0 || x > room_width) {
	state.hsp = -state.hsp;
	state.hspf = -state.hspf;
	x += sign(state.dir);
}

if(y <= 1500 && (state.str == "idle" || state.str == "windup")) {
		var zoom = lerp(y, 1500, 0.1) - y;
		y += zoom;
	    obj_game_controller.height += zoom;
		with(obj_collider_parent) y += zoom;
        with(obj_entity_parent) y += zoom;
	}

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
    state.vsp = 0
	state.fric = base.fric.plat;
	if(i_down) { // if click, windup.
		state.str = "windup";
		break;
	}
	
	// adds wiggle room by making the frog more "sticky" to platforms.
	if(place_meeting(x, y, obj_platform_parent)) {
		y -= bbox_bottom - state.platid.bbox_top;
		if(bbox_left > state.platid.bbox_right) {
			x = lerp(x, state.platid.bbox_right, 0.5);
		}
		if(bbox_right < state.platid.bbox_left) {
			x = lerp(x, state.platid.bbox_left, 0.5);
		}
	}
	if(!place_meeting(x, y + 1, obj_collider_parent)) {
		state.str = "falling";
		break;
	}
	#endregion
	break;
	case "windup":
	#region // windup
	image_index = 1;
	if(state.vsp < 0) {
		state.str = "rising"; // if go up, rising.
		break;
	}
	if(i_up) {
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
