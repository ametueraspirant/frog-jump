/// @description Init Frog
image_speed = 0
base = { // store base stats like gravity and friction to call later.
	grav: { // gravity
		rise: 0.8, // gravity while rising
		fall: 0.9, // gravity while falling
		plat: 0, // gravity while on platform, just in case.
		spd: 25 // max falling speed
	},
	fric: { // friction
		air: 0.2, // friction while in air
		plat: 2.2, // friction while on platforms
		spd: 10
	},
	timer: {
		coyote: 10, //coyote time, 10 frames
		bullet: room_speed * 1 //bullet time, 1 second
	},
	jumpstr: 40
};

state = { // frog current state
	str: "falling", // set to rising, falling, coyote, and idle depending on frog motion
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
	platid: noone, // saving the platform id
	msavx: 0, // mouse drag starting x position
	msavy: 0, // mouse drag starting y position
	himp: 0, // stored horizontal impulse
	vimp: 0, // stored vertical impulse
};

// saved line values
line = {
	len: 0,
	ang: 0
};

// line max length
max_length = 320;
