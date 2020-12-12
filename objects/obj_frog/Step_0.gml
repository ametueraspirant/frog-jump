/// @description Move Frog

if(m_down) {
	state.mx = mouse_x;
	state.my = mouse_y;
}

if(m_held) {
	
}

if(m_up) {
	state.hi = max(-max_length, min(max_length, lengthdir_x(state.mx - mouse_x, image_angle)));
	state.vi = min(max_length, lengthdir_y(state.my - mouse_y, image_angle+90));
	jump(state);
}



//Jumping
if place_meeting(x,y+1,obj_collider_parent) and keyboard_check_pressed(vk_space)
    {
    vsp += -(y-mouse_y)/15
    with(obj_game_controller)
        {
        move_platforms(100)
        }
}

//Move left and right
if keyboard_check(ord("D"))
x += 10
if keyboard_check(ord("A"))
x += -10
vsp += 2

//vertical collision
if place_meeting(x,y+abs(vsp),obj_collider_parent) and vsp > 0
    {
    while(!place_meeting(x,y+sign(vsp),obj_collider_parent)) and vsp > 0
        {
        y += sign(vsp)
        }    
    vsp = 0
    }
y += vsp

