//Jumping
if place_meeting(x,y+1,obj_platform) and keyboard_check_pressed(vk_space)
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
if place_meeting(x,y+abs(vsp),obj_platform) and vsp > 0
    {
    while(!place_meeting(x,y+sign(vsp),obj_platform)) and vsp > 0
        {
        y += sign(vsp)
        }    
    vsp = 0
    }
y += vsp

