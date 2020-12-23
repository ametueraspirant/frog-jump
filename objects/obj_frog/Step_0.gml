/// @description Move Frog

switch(state.str) {
	case "rising":
		state.grav = base.grav.rise;
		state.fric = base.fric.air;
		if(state.vsp > 0) { // if go down, falling.
			state.str = "falling";
			break;
		}
	break;
	case "falling":
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
		if(place_meeting(x, y + state.vsp, obj_collider_parent) && bbox_bottom.y >= state.platid.bbox_bottom.y) {
			vsp = 0;
			state.str = "idle";
			break;
		}
	break;
	case "idle":
		state.fric = base.fric.plat;
		if(m_down) { // if click, windup.
			state.str = "windup";
			break;
		}
		// add falling logic here
	break;
	case "windup":
		if(state.vsp > 0) {
			state.str = "rising"; // if go up, rising.
			break;
		}
		// and here that doesn't conflict with camera zoom.
	break;
	case "coyote":
	
	break;
	default:
	
	break;
}

move_frog(state, base);