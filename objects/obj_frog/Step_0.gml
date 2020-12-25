/// @description Move Frog

state = increment_fractions(state);
		
if(get_id() != noone)state.platid = get_id();

if(state.hsp > 0)state.dir = 1;
if(state.hsp < 0)state.dir = -1;

if(state.hsp <= 1)state.hsp = 0;
else state.hsp -= state.fric * state.dir;

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
	if(state.vsp <= 0) { // if go up, rising.
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
	if(state.vsp > 0) {
		state.str = "rising"; // if go up, rising.
		break;
	}
	// and here that doesn't conflict with camera zoom.
	#endregion
	break;
	case "coyote":
	#region // coyote
	
	#endregion
	break;
	default:
	#region // default
	
	#endregion
	break;
}

if(place_meeting(x, y + state.vsp, obj_collider_parent) && bbox_bottom <= state.platid.bbox_top) {
	vsp = 0;
	state.str = "idle";
} else {
	state.vsp += state.grav;
}
y += state.vsp;
x += state.hsp;