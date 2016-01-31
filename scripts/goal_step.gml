
var player_goal_touching = place_meeting(x,y, obj_player)

if  player_goal_touching and !is_colliding_with_player {
    is_colliding_with_player = true
    audio_play_sound(snd_endlevel, true, 0)
    var win_test = player_goal_test()
    var errors = win_test[? 'errors']
    if ds_list_empty(errors) {
        level_win()
    } else {
    /*
        for(i = 0; i < ds_list_size(errors); i ++) {
            log(ds_list_find_value(errors, i))
        }
        */
    }
} 
if !player_goal_touching {
    is_colliding_with_player = false
}

