// Inherit the parent event
event_inherited();

if(instance_exists(obj_frog)){
    if(place_meeting(x, y, obj_frog)){
        if(obj_frog.state.vsp < 0 and obj_frog.y > y){
                instance_destroy(obj_frog)
        }
    }
}
if(instance_exists(obj_frog)){
    if(place_meeting(x, y, obj_frog)){
        if(obj_frog.state.vsp > 0 and obj_frog.y < y){
            instance_change(obj_snake_fall,1)
            obj_frog.state.str = "rising"
            obj_frog.state.vsp = -15
        }
    }
}