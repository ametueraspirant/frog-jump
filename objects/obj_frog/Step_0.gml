/// @description Move Frog

state = increment_fractions(state); // increment fractions code makes sure frog always moving at incremental speeds.
		
if(get_id() != noone)state.platid = get_id(); // checks every frame for a nearby platform in the jump path of the frog and gets the id.

// sets the frog's direction depending on speed.
if(state.hsp > 0)state.dir = 1;
if(state.hsp < 0)state.dir = -1;

// sets the frog speed to 0 if it's too low
if(abs(state.hsp) <= 1 && state.str == "idle")state.hsp = 0 && state.hspf = 0; // this a thing I can do?
else state.hsp -= state.fric * state.dir * abs(state.hsp/base.fric.spd);

// on mouse click, save first position.
if(m_down) {
	state.msavx = mouse_x;
	state.msavy = mouse_y;
}

// on mouse held, show the jump arc prediction line.
if(m_held) {
	line.len = point_distance(state.msavx, state.msavy, mouse_x, mouse_y); 
	line.ang = point_direction(state.msavx, state.msavy, mouse_x, mouse_y);
	state.himp = (min(max_length, line.len) * dcos(line.ang)) / (max_length / base.jumpstr);
	state.vimp = (min(max_length, line.len) * dsin(line.ang)) / (max_length / base.jumpstr);
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
    var movement = 1500
	y = lerp(y, movement, 0.1); // move frog.
    with(obj_collider_parent)
    y = lerp(y, movement, 0.1); // and platform.
}

//if state.vsp > 0 and place_meeting(x,y+state.vsp,obj_collider_parent){
//while(!place_meeting(x,y+1,obj_collider_parent))
//y += 1
//state.vsp = 0
//}
//else
//state.vsp += base.grav.fall
//y += state.vsp

//if state.str == "idle"
//{
//    if place_meeting(x,y,obj_collider_parent)
//        {
//        var platform = instance_place(x,y,obj_collider_parent)
//        if y > platform.y
//        while(place_meeting(x,y,platform)) 
//        y += -1
//        }
//}
if(!place_meeting(x, y + state.vsp, obj_collider_parent)) {
    if(state.vsp <= base.grav.spd) {
        state.vsp += state.grav;
    }
} else {
    if(state.vsp > 0) {
        while(!place_meeting(x, y + sign(state.vsp), obj_collider_parent)) {
            y += sign(state.vsp);
        }
        state.vsp = 0;
        state.vspf = 0;
    }
}
y += state.vsp
x -= state.hsp;

if(x < 0 || x > room_width) {
	state.hsp = -state.hsp;
	state.hspf = -state.hspf;
	x += sign(state.dir);
};

switch(state.str) {
	case "rising":
	#region // rising
    global.height += 1
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
	if(state.vsp < 0) {
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
if instance_exists(obj_platform){
    if state.str == "rising" or state.str == "falling"{
        obj_platform.vspeed = -obj_frog.state.vsp
    }
    else{
    obj_platform.vspeed = 0
    }
}