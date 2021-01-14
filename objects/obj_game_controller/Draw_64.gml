/// @description Draw Debug Messages

//draw_text(50, 50, string());
if(debug_on) {
	draw_text_transformed(20, 20, "horizontal Impulse: " + string(obj_frog.state.himp), 2, 2, 0);
	draw_text_transformed(20, 40, "vertical impulse: " + string(obj_frog.state.vimp), 2, 2, 0);
	draw_text_transformed(20, 60, "line angle: " + string(obj_frog.line.ang), 2, 2, 0);
	draw_text_transformed(20, 80, "line length: " + string(obj_frog.line.len), 2, 2, 0);
	draw_text_transformed(20, 100, "line start coords x: " + string(obj_frog.state.msavx) + " y: " + string(obj_frog.state.msavy), 2, 2, 0);
	draw_text_transformed(20, 120, "line end coords y: " + string(mouse_x) + " y: " + string(mouse_y), 2, 2, 0);
	draw_text_transformed(20, 140, "current frog height: " + string(obj_frog.y), 2, 2, 0);
	draw_text_transformed(20, 160, "hsp: " + string(obj_frog.state.hsp), 2, 2, 0);
	draw_text_transformed(20, 180, "vsp: " + string(obj_frog.state.vsp), 2, 2, 0);
	draw_text_transformed(20, 200, "id: " + string(obj_frog.state.platid), 2, 2, 0);
	draw_text_transformed(20, 220, "state: " + string(obj_frog.state.str), 2, 2, 0);
  draw_text_transformed(20, 240, "global.height: " + string(global.height), 2, 2, 0);
  draw_text_transformed(20, 260, "global.next_height: " + string(global.next_height), 2, 2, 0);
	if(m_held) {
		draw_line_width_colour(obj_frog.state.msavx, obj_frog.state.msavy, mouse_x, mouse_y, 5, c_orange, c_green); //testing line
		draw_circle_color(obj_frog.state.msavx, obj_frog.state.msavy, obj_frog.max_length, c_orange, c_green, true)
	}
}

