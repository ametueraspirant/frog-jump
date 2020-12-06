/// @description Init Game

// the big macros
#macro main_layer "Instances"
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_up mouse_check button_released(mb_left)

// list of the most common phone displays
res = {
	p540: [540, 960],
	p640: [640, 1136],
	p720: [720, 1280],
	x720: [720, 1440],
	p750: [750, 1334],
	p1125: [1125, 2436],
	p1080: [1080, 1920],
	x1080: [1080, 2160],
	p1440: [1440, 2560],
	x1440: [1440, 2960]
}

/*
global.res = { }
global.res[$ "540p"] = [540, 960];
global.res[$ "640p"] = [640, 1136];
global.res[$ "750p"] = [750, 1334];

function window_set_size_ext(_res) {
    if (!variable_struct_exists(global.res, _res)) return;
    var _size = global.res[$ _res];
    window_set_size(_size[0], _size[1]);
}

window_set_size_ext("750p");
*/


state = {
	gmode: "menu" //this will be set to the string menu, prep, go, and scores, and called by other objects.
	
}
