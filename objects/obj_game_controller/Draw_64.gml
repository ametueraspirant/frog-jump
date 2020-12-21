/// @description Draw Debug Messages

//draw_text(50, 50, string());
if(debug_on) {
	with(obj_frog) {
		draw_text_transformed(20, 20, "horizontal Impulse: " + string(state.hi), 2, 2, 0);
		draw_text_transformed(20, 40, "vertical impulse: " + string(state.vi), 2, 2, 0);
		draw_text_transformed(20, 60, "line angle: " + string(line.a), 2, 2, 0);
		draw_text_transformed(20, 80, "line length: " + string(line.l), 2, 2, 0);
		draw_text_transformed(20, 100, "line start coords x: " + string(state.mx) + " y: " + string(state.my), 2, 2, 0);
		draw_text_transformed(20, 120, "line end coords y: " + string(mouse_x) + " y: " + string(mouse_y), 2, 2, 0);
		if(m_held) {
			draw_line_width_colour(state.mx, state.my, mouse_x, mouse_y, 5, c_orange, c_green); //testing line
			draw_circle_color(state.mx, state.my, max_length, c_orange, c_green, true)
		}
	}
}

