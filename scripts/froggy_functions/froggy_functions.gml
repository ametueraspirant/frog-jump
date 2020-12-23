function move_frog(_state, _base) {
	with(obj_frog) {
		state = increment_fractions(state);
		if(inst() != noone)state.platid = inst();
		
	}
}