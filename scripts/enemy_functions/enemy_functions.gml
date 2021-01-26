// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_snake_spawn(_x, _y){
    var success = irandom_range(1,10)
    //Check if snake spawns
    if(snake_chance == success){
        instance_create_layer(_x, _y, _main_layer, obj_snake)
    }else{
        snake_chance += snake_chance_incre
    }
}