/// @description Init Game

// the big macros
#macro main_layer "Instances"
#macro m_down mouse_check_button_pressed(mb_left)
#macro m_up mouse_check_button_released(mb_left)
//#macro 

// list of the most common phone displays
global.res = {};
global.res[$ "540p"] = [540, 960];
global.res[$ "640p"] = [640, 1136];
global.res[$ "720p"] = [720, 1280];
global.res[$ "720x"] = [720, 1440];
global.res[$ "750p"] = [750, 1334];
global.res[$ "1080p"] = [1080, 1920];
global.res[$ "1080x"] = [1080, 2160];
global.res[$ "1125p"] = [1125, 2436];
global.res[$ "1440p"] = [1440, 2560];
global.res[$ "1440x"] = [1440, 2960];

// @author xDGameStudios
// @desc function to grab display and set the window. 
// @use window_set_size_ext("750p");
function window_set_size_ext(_cur) {
    if (!variable_struct_exists(global.res, _cur)) {
		show_debug_message("something went wrong or that resolution doesn't exist. set to default 1080p");
		_cur = "1080p"
	}
    var _size = global.res[$ _cur];
    window_set_size(_size[0], _size[1]);
}

state = {
	gmode: "menu" //this will be set to the string menu, prep, go, and scores, and called by other objects.
	
}
