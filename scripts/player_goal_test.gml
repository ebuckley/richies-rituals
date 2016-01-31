var result = ds_map_create()
var errorMessages = ds_list_create()
var routineStates = ds_list_create()
var isAWinner = false
for (i = 0; i < ds_list_size(global.activeRoutines); i++) {
    var thisRoutine = ds_list_find_value(global.activeRoutines, i)
    var routineState = ds_map_create()
    ds_map_add(routineState, 'name', thisRoutine)
    // see game_init script for routine names
    if thisRoutine == ds_list_find_value(global.referenceRoutines, 0) {
        if global.jump_count % 2 != 0 {
            ds_list_add(errorMessages, 'even number of jumps needed to win!!')
            ds_map_add(routineState, 'value', false)
        } else {
            ds_map_add(routineState, 'value', true)       
        }
    } else if thisRoutine == ds_list_find_value(global.referenceRoutines, 1) {
        if global.jump_count < 4 {
            var msg = 'jump more than 4 times, you only jumped ' + string(global.jump_count) + ' times!!'
            ds_list_add(errorMessages, msg)
            ds_map_add(routineState, 'value', false)
        } else { ds_map_add(routineState, 'value', true) }
    } else if thisRoutine == ds_list_find_value(global.referenceRoutines, 2) {
        if global.jump_count != 6 {
            var msg = 'you must jump exactly 6 times but you have jumped' + string(global.jump_count) + ' times!!'
            ds_list_add(errorMessages, msg)
            ds_map_add(routineState, 'value', false)
        } else { ds_map_add(routineState, 'value', true) }
    } else if thisRoutine == ds_list_find_value(global.referenceRoutines, 3) {
        if global.has_moved_left {
            ds_list_add(errorMessages, 'you can only move right!')
            ds_map_add(routineState, 'value', false)
        } else { ds_map_add(routineState, 'value', true) }
    } else if thisRoutine == ds_list_find_value(global.referenceRoutines, 4) {
        if global.has_moved_right {
            ds_list_add(errorMessages, 'you can only move left!')
            ds_map_add(routineState, 'value', false)
        } else { ds_map_add(routineState, 'value', true) }
    } else if thisRoutine == ds_list_find_value(global.referenceRoutines, 5) {
        if lives == 5 {
            ds_list_add(errorMessages, "it demands you sacrifice a life")
            ds_map_add(routineState, 'value', false)
        } else {
            ds_map_add(routineState, 'value', true)
        }
    } else {
        var msg = 'blame ersin, the code is broked: ' + ds_list_find_value(global.referenceRoutines, 0) + ' is not implemented'
        log(msg)
    }
    
    ds_list_add(routineStates, routineState)
}
ds_map_add_list(result, 'errors', errorMessages)
ds_map_add_list(result, 'activeRoutines', routineStates)
return result

