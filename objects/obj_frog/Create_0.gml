/// @description Init Frog
max_length = 320;

// store base stats like gravity and friction to call later.
base = {
	grav: { // gravity
		rise: 0.7, // gravity while rising
		fall: 1.0 // gravity while falling
	},
	frict: { // friction
		air: 0.2, // friction while in air
		plat: 0.5 // friction wh ile on platforms
	}
}

state = {
	str: "falling", // set to rising, falling, and idle depending on frog motion
	msavx: 0, // mouse drag starting x position
	msavy: 0, // mouse drag starting y position
	himp: 0, // stored horizontal impulse
	vimp: 0, // stored vertical impulse
	hsp: 0, // horizontal speed
	vsp: 0 // vertical speed
};

line = {
	len: 0,
	ang: 0
}
