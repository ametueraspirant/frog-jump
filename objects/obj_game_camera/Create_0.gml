/// @description Init Camera

// list of the most common phone displays
res = {};
res[$ "540p"] = [540, 960];
res[$ "640p"] = [640, 1136];
res[$ "720p"] = [720, 1280];
res[$ "720x"] = [720, 1440];
res[$ "750p"] = [750, 1334];
res[$ "1080p"] = [1080, 1920];
res[$ "1080x"] = [1080, 2160];
res[$ "1125p"] = [1125, 2436];
res[$ "1440p"] = [1440, 2560];
res[$ "1440x"] = [1440, 2960];

// @author xDGameStudios
// @desc function to grab display and set the window. 
// @use window_set_size_ext("750p");
function window_set_size_ext(_cur) {
    if (!variable_struct_exists(res, _cur)) {
		show_debug_message("something went wrong or that resolution doesn't exist. set to default 1080p");
		_cur = "1080p"
	}
    var _size = res[$ _cur];
    window_set_size(_size[0], _size[1]);
	surface_resize(application_surface, _size[0], _size[1]);
}

window_set_size_ext("540p");
