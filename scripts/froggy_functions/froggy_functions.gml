function jump(_force) {
	move_frog(_force);
	move_platforms(_force);
};

function move_frog(_force) {
	with(obj_frog) {
		state.vs -= _force.vi * 0.1;
		state.hs += _force.hi;
	};
}
