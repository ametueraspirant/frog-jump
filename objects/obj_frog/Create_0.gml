/// @description Init Frog
// store base stats like gravity and friction to call later.
base = {
	grav: { // gravity
		rise: 0.7, // gravity while rising
		fall: 1.0 // gravity while falling
	},
	frict: { // friction
		air: 0.2, // friction while in air
		plat: 0.5 // friction while on platforms
	}
};

// frog current state
state = {
	str: "falling", // set to rising, falling, and idle depending on frog motion
	hsp: 0, // horizontal speed
	vsp: 0 // vertical speed
};
