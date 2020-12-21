/// @description Init Frog
max_length = 320;

// store base stats like gravity and friction to call later.
base = { 
	
}

state = {
	str: "falling", // set to rising, falling, and idle depending on frog motion
	mx: 0, // mouse drag starting x position
	my: 0, // mouse drag starting y position
	hi: 0, // stored horizontal impulse
	vi: 0, // stored vertical impulse
	hs: 0, // horizontal speed
	vs: 0 // vertical speed
};

line = {
	l: 0,
	a: 0
}