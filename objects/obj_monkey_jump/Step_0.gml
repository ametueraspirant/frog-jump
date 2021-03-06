// Inherit the parent event
event_inherited();

if(instance_exists(obj_frog)){
    if(place_meeting(x, y, obj_frog)){
                instance_destroy(obj_frog)
        }
    }

vsp += grav
x += hsp
y += vsp
