function jump(_force) {
	calc_frog_impulse(_force);
	calc_platform_impulse(_force);
};

function calc_frog_impulse(_force) {
	with(obj_frog) {
		state.vs -= _force.vi * 0.1;
		state.hs += _force.hi;
	};
}

function move_frog(_force) {
	
	
	move_platforms(_replace_this)
}