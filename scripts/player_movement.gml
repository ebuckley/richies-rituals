
//TODO this is a probs not the right location for this script
if place_meeting(x,y,obj_goal) {
    player_goal_test()
}

if place_free(x,y+1) { 
    gravity = player_gravity
} else {

    // if we get jammed into a platform from the bottom side then force us out the bottom
    if direction == 90 {
        move_outside_solid(270,100)
    } else if direction == 270 { //if we are falling down into an object
        move_outside_solid(90,100)
    }
    state_is_jumping = false
    gravity = 0
    vspeed = 0
}
//the arrow keys<,>,^ 
if place_free(x-4,y)and keyboard_check(vk_left){
    if !state_is_jumping {
        global.has_moved_left = true
        global.has_moved_right = false
    }
    image_xscale = -1
    x-=player_speed
} 
if place_free(x+4,y)and keyboard_check(vk_right){
    if !state_is_jumping {
        global.has_moved_right = true
        global.has_moved_left = false
    }
    image_xscale = 1
    x+=player_speed
}

if !place_free(x,y+1) and keyboard_check(vk_up){
    vspeed=-1 * player_jump
}


// jump counting
if keyboard_check_released(vk_up) and !state_is_jumping {
    state_is_jumping = true
    global.jump_count += 1
}

// animation control
if state_is_jumping {
    image_speed = 1.5
} else {
    image_speed = 0
}

if keyboard_check(vk_left) or keyboard_check(vk_right) {
    image_speed = 1
}

