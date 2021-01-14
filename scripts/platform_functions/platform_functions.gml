function old_spawn_platforms(_height)
    {
    sprite = spr_branch
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

function test_spawn_platforms()
    {
    global.spawn_platforms = true
    repeat(1){
    platform_type = obj_platform
    sprite = platform_type.sprite_index
    spr_height_center = sprite_get_height(sprite)/2
    spr_width_center = sprite_get_width(sprite)/2
    height_range = irandom_range(-spr_height_center,-500)
    platform = instance_create_layer(irandom_range(spr_width_center,room_width-spr_width_center),height_range,_main_layer,platform_type)
    if collision_circle(platform.x,platform.y,spr_width_center*3,obj_collider_parent,0,1)
        {
        platform.x = irandom_range(spr_width_center,room_width-spr_width_center)
        platform.y = height_range
        }
    }
    }