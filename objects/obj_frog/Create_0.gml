/// @description Init Frog
image_speed = 0
base = { // store base stats like gravity and friction to call later.
	grav: { // gravity
		rise: global.grav.rise * 0.1, // gravity while rising
		fall: global.grav.fall * 0.1, // gravity while falling
		plat: 0, // gravity while on platform, just in case.
		spd: global.max_fall_speed * 0.1 // max falling speed
	},
	fric: { // friction
		air: 0.2, // friction while in air
		plat: 0.5 // friction while on platforms
	},
	timer: {
		coyote: 10, //coyote time, 10 frames
		bullet: room_speed * 1 //bullet time, 1 second
	},
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
	dir: 1, // direction facing
	platid: noone // saving the platform id
};
