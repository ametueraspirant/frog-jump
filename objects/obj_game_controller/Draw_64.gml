/// @description Draw Debug Messages

//draw_text(50, 50, string());
if(debug_on) {
	draw_text(20, 20, "horizontal Impulse: " + string(obj_frog.state.hi));
	draw_text(20, 40, "vertical impulse: " + string(obj_frog.state.vi));
}