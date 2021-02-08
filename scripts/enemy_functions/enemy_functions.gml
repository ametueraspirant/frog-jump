// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_snake_spawn(_x, _y){
    var max_success = 35
    var success = irandom_range(1,max_success)
    //Check if snake spawns
    if(snake_chance >= success){
        snake_chance = 1
        instance_create_layer(_x, _y, _main_layer, obj_snake_platform)
    }else{
        if(snake_chance != max_success){
            snake_chance += snake_chance_incre
        }
    }
}