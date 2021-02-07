function old_spawn_platforms(_height)
    {
    sprite = spr_branch
    spr_width_center = sprite_get_width(sprite)/2
    //spr_height = sprite_get_height(sprite)
    height_range = irandom_range(-spr_height*6,-spr_height*3)
    //Change Spawn Behavior
    if (height >=next_height)
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
            //Create new platforms at varrying heights
            platform = instance_create_layer(irandom_range(spr_width_center,room_width-spr_width_center),height_range,_main_layer,obj_platform)
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


//function spawn_platforms(){
//    var platform_type = obj_platform
//    var center_width = platform_type.sprite_width/2
//    var spr_height = platform_type.sprite_height
//    var horz_spawn_range = irandom_range(center_width,room_width-center_width)
//    var vert_spawn_range = irandom_range(-spr_height,-50)
    
//    instance_create_layer(horz_spawn_range, vert_spawn_range, _main_layer, platform_type)
//}

function spawn_platforms(r1, r2){
        var platform_type = obj_platform
        var center_width = platform_type.sprite_width/2
        var horz_spawn_range = irandom_range(center_width,room_width-center_width)
        var vert_spawn_range = irandom_range(r1,r2)
        var platform = instance_create_layer(horz_spawn_range, vert_spawn_range, _main_layer, platform_type)
        if(instance_exists(platform)){
            check_snake_spawn(platform.x, platform.y);
        }
        if collision_circle(platform.x,platform.y,horz_spawn_range*2,obj_platform,0,1)
            {
            platform.x = horz_spawn_range
            platform.y = vert_spawn_range
            }
}

function move_away_platforms(r1, r2){ 
    var center_width = sprite_width/2
    var horz_spawn_range = irandom_range(center_width,room_width-center_width)
    var vert_spawn_range = irandom_range(r1,r2)
    if collision_circle(x,y,center_width*2,obj_platform_parent,0,1)
        {
        x = horz_spawn_range
        y = vert_spawn_range
        }
}