/// @description Init Frog

base = { // store base stats like gravity and friction to call later.
	grav: { // gravity
		rise: global.grav.rise * 0.1, // gravity while rising
		fall: global.grav.fall * 0.1 // gravity while falling
	},
	fric: { // friction
		air: 0.2, // friction while in air
		plat: 0.5 // friction while on platforms
	},
	timer: {
		coyote: 10, //coyote time, 10 frames.
		bullet: room_speed * 1.5 //bullet time, 1.5 seconds.
	}
};

state = { // frog current state
	str: "falling", // set to rising, falling, and idle depending on frog motion
	hsp: 0, // horizontal speed
	hspf: 0, // horizontal speed fractional
	vsp: 0, // vertical speed
	vspf: 0, // vertical speed fractional
	grav: base.grav.fall, // set gravity
	fric: base.fric.air,
	t: { // timers
		coyote: 0,
		bullet: 0
	},
	platid: noone // saving the platform id.
};

function inst(){instance_place(x + state.hsp, y + state.vsp, obj_collider_parent)}; // function for getting platform id.