/// @description Init Platforms

// base stats like gravity
base = {
	grav: {
		rise: global.grav.rise * -0.9, // gravity while rising
		fall: global.grav.fall * -0.9, // gravity while falling
		plat: 0, // gravity while on platform, just in case
		spd: global.max_fall_speed * -0.9 // max falling speed
	}
}

// current platform state
state = {
	type: "basic", // platform type. set at creation.
	vsp: 0, // vertical speed.
	vspf: 0 // vertical speed fractional.
	
};

