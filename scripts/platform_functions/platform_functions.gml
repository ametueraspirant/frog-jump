function move_platforms(_force) {
	with(obj_collider_parent) {
	state.hs += _force.hi * 0.9;
	};
	spawn_platforms(global.height);
};

function spawn_platforms(_height)
    {
    sprite = spr_platform_test
    spr_width_center = sprite_get_width(sprite)/2
    spr_height = sprite_get_height(sprite)
    height_range = irandom_range(-spr_height*6,-spr_height*3)
    //Change Spawn Behavior
    if (global.height >= global.next_height)
        {
        global.next_height += global.amount
        //behavior = irandom(2)
        }
    
    //Spawning
    switch(global.behavior)
        {
        //Normal Spawning
        case 0: 
            {
            //Create 5 new platforms at varrying heights
            platform = instance_create_layer(irandom_range(spr_width_center,room_width-spr_width_center),height_range,_main_layer,obj_platform)
            if collision_circle(platform.x,platform.y,spr_width_center,obj_platform,0,1)
                {
                platform.x = irandom_range(spr_width_center,room_width-spr_width_center)
                platform.y += -spr_height
                }

            break;
            }  
        //Sparse Spawning
        case 1:
            {
            
            break;
            }
        //Whatever Spawning
        default:
            {
            
            break;
            }
        }
    }