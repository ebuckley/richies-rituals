//argument 0 is next level

with (global.player) {
    instance_destroy()
}
with (global.goal) {
    instance_destroy()
}

global.levels_completed += 1

if ds_list_empty(global.possibleRoutines) {
    log('GG FRIEND YOU WON THE WHOLE GAME!!!')
    room_goto(room_you_won_the_game)
    log('should have gone to the room........')
    ds_list_destroy(global.activeRoutines)
} else {
    if room_exists(room_next(room)) and room_next(room) != room_you_won_the_game {
        room_goto_next()
    } else {
        room_goto(room0)
        ds_list_add(global.activeRoutines, ds_list_find_value(global.possibleRoutines, 0))
        ds_list_delete(global.possibleRoutines, 0)
    }
}
