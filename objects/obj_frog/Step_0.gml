/// @description Jump Frog Jump

// check if computer input here? <--
if(m_down) {
	m_save.mx1 = mouse_x;
	m_save.my1 = mouse_y;
};

if(m_held) {
	// draw line and jump indicators
}

if(m_up) {
	m_save.mx2 = mouse_x;
	m_save.my2 = mouse_y;
	show_debug_message(m_save.mx2 - m_save.mx1);
	show_debug_message(m_save.my2 - m_save.my1);
};
