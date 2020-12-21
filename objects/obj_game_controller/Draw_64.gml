/// @description Draw Debug Messages

//draw_text(50, 50, string());
if(debug_on) {
	draw_text_transformed(20, 20, "horizontal Impulse: " + string(state.himp), 2, 2, 0);
	draw_text_transformed(20, 40, "vertical impulse: " + string(state.vimp), 2, 2, 0);
	draw_text_transformed(20, 60, "line angle: " + string(line.ang), 2, 2, 0);
	draw_text_transformed(20, 80, "line length: " + string(line.len), 2, 2, 0);
	draw_text_transformed(20, 100, "line start coords x: " + string(state.msavx) + " y: " + string(state.msavy), 2, 2, 0);
	draw_text_transformed(20, 120, "line end coords y: " + string(mouse_x) + " y: " + string(mouse_y), 2, 2, 0);
	draw_text_transformed(20, 140, "current frog height: " + string(obj_frog.y), 2, 2, 0);
	if(m_held) {
		draw_line_width_colour(state.msavx, state.msavy, mouse_x, mouse_y, 5, c_orange, c_green); //testing line
		draw_circle_color(state.msavx, state.msavy, max_length, c_orange, c_green, true)
	}
}

